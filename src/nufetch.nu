let nufetch_ver = "0.5"

let os_full_name = (sys).host.long_os_version
let os_kernel_version = (sys).host.kernel_version
let user = (sys).host.hostname
#let boot_time = (sys).host.boot_time

let cpu_name = (sys).cpu.0.brand
let mem_total = (sys).mem.total
let mem_used = (sys).mem.used

let wifi_name = (sys).net.0.name
let wifi_up = (sys).net.0.sent
let wifi_down = (sys).net.0.recv

let full_user = $"($user)@ ($os_full_name) ($os_kernel_version)"
let full_cpu = $"CPU: ($cpu_name)"
let full_mem = $"Memory: ($mem_used) / ($mem_total)"
let full_net = $"Network: ($wifi_name) ↑($wifi_up) ↓($wifi_down)"

let full_output = $full_user + "\n" + $full_cpu + "\n" + $full_mem + "\n" + $full_net
let $output = [[$"NuFetch v($nufetch_ver)"]; [$full_output];]
echo $output