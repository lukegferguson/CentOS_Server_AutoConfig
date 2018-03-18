Import-Module -Name Hyper-V

#General variables
$time = get-date -format "MMyydd.hhmmss"
$VMName = "CentOS_Core_$time"
$VMpath = "E:\VMs"
$OS_ISO = "E:\Software\CentOS\CentOS-7-x86_64-Minimal-1708.iso"

#Variables specifically for New-VM creation
$VM = @{
Name = $VMName
MemoryStartupBytes = 4096MB
Generation = 1
NewVHDPath = "$VMpath\$VMName\$VMname.vhdx"
NewVHDSizeBytes = 35000MB
BootDevice = "VHD"
Path = "$VMpath"
SwitchName = (Get-VMSwitch).Name
}

#Create new VM with settings from array above
New-VM -Name $VM.name -NewVHDPath $vm.NewVHDPath -NewVHDSizeBytes $vm.NewVHDSizeBytes -MemoryStartupBytes $vm.MemoryStartupBytes`
-Generation $vm.Generation -BootDevice $vm.BootDevice -Path $vm.Path -SwitchName $vm.SwitchName

#Specify OS ISO to start in virtual DVD drive
Set-VMDvdDrive -VMName $VMName -Path $OS_ISO

#start that VM up!
start-vm $VMName