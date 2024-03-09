new-qemu-vhd() {
    qemu-img create -f qcow2 $1 16G
}

fresh-start-qemu() {
    qemu-system-x86_64 \
        -enable-kvm \
        -m 2048 \
        -nic user,model=virtio \
        -drive file=$1,media=disk,if=virtio \
        -cdrom $2 \
        -display gtk
}

start-qemu() {
    qemu-system-x86_64 \
        -enable-kvm \
        -m 2048 \
        -nic user,model=virtio,hostfwd=tcp::5555-:22,net=192.168.76.0/24,dhcpstart=192.168.76.9 \
        -drive file=$1,media=disk,if=virtio \
        -display gtk
}

arch_vm_init() {
    n=2
    sudo cp ~/Qemu/vhd/arch_cloud.qcow2 /var/lib/libvirt/arch_cloud/arch_cloud_$n.qcow2
    virt-install \
        --name arch_cloud_$n \
        --memory 1024 \
        --vcpus=1,maxvcpus=1 \
        --cpu host \
        --disk /var/lib/libvirt/arch_cloud/arch_cloud_$n.qcow2 \
        --import \
        --network network=arch_cloud \
        --os-variant=archlinux \
        --graphics vnc
}

enable_vm_ttyS0() {
    # run it in VM
    systemctl enable serial-getty@ttyS0.service
    systemctl start serial-getty@ttyS0.service
}
