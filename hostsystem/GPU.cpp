//    Copyright 2019 Lars Wienbrandt, Jan Christian Kässens
//
//    This file is part of SNPInt-GPU.
//
//    SNPInt-GPU is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    SNPInt-GPU is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with SNPInt-GPU.  If not, see <https://www.gnu.org/licenses/>.

#include <iomanip>
#include <sstream>
#include <iostream>

#include <hip/hip_runtime.h>

#include "GPU.h"

namespace hostsystem {

GPU::GPU(int bus_, int slot_)
    : bus(bus_), slot(slot_), serial(""), gpuIndex(-1)
{
    // Initialize ROCm SMI
    std::cerr << "About to initialize ROCm SMI " << std::endl;
    rsmi_status_t ret = rsmi_init(0);
    if (ret != RSMI_STATUS_SUCCESS) {
        throw std::runtime_error("Failed to initialize ROCm SMI");
    }

    // Find the GPU handle using ROCm SMI
    uint32_t device_count;
    std::cerr << "About to check the number of available devices " << std::endl;
    ret = rsmi_num_monitor_devices(&device_count);
    if (ret != RSMI_STATUS_SUCCESS) {
        throw std::runtime_error("Failed to get number of monitor devices");
    }
    std::cerr << "device_count = " << device_count << std::endl;
    
    int gpuIndexCheck = -1;
    for (uint32_t i = 0; i < device_count; i++) {
        uint64_t bdfid;
        ret = rsmi_dev_pci_id_get(i, &bdfid);
        std::cerr << "bdfid = " << std::hex << bdfid << std::dec << std::endl;
        if (ret == RSMI_STATUS_SUCCESS) {
            int current_bus = (bdfid >> 8) & 0xff;
            int current_slot = (bdfid >> 3) & 0x1f;
            std::cerr << "bus_=" << bus_ << ", current_bus=" << current_bus << std::endl;
            std::cerr << "slot_=" << slot_ << ", current_slot=" << current_slot << std::endl;
            if (current_bus == bus_ && current_slot == slot_) {
                gpuIndexCheck = i;
                break;
            }
        }
    }
    if (gpuIndexCheck == -1) {
        throw std::runtime_error("No matching GPU found for the given bus and slot");
    }

    // Map a HIP device index to a physical ID
    int numGPUs = 0;
    hipGetDeviceCount(&numGPUs);
    for (int i = 0; i < numGPUs; i++) {
        hipDeviceProp_t props;
        hipGetDeviceProperties(&props, i);
        if (props.pciBusID == bus_ && props.pciDeviceID == slot_) {
            gpuIndex = i;
            break;
        }
    }
    if (gpuIndex == -1) {
        throw std::runtime_error("No matching HIP device found for the given bus and slot");
    }

    // Query for the serial number using ROCm SMI
    char serial_buf[128];
    ret = rsmi_dev_serial_number_get(gpuIndex, serial_buf, sizeof(serial_buf));
    if (ret == RSMI_STATUS_SUCCESS) {
        this->serial = std::string(serial_buf);
    } else {
        throw std::runtime_error("Failed to get GPU serial number");
    }


}

int GPU::getBus() { return bus; }

int GPU::getSlot() { return slot; }

const std::string &GPU::getSerialNumber() const { return serial; }

int GPU::getIndex() const { return gpuIndex; }

}
