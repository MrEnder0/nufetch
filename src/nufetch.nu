#nufetch vars
let nufetch_ver = "2023-004"

#sysinfo vars
let os_full_name = (sys).host.long_os_version
let os_kernel_version = (sys).host.kernel_version
let user = (sys).host.hostname
#let boot_time = (sys).host.boot_time

#cpu vars
let cpu_name = (sys).cpu.0.brand

#mem vars
let mem_total = (sys).mem.total
let mem_used = (sys).mem.used

#wifi vars
let wifi_name = (sys).net.0.name
let wifi_up = (sys).net.0.sent
let wifi_down = (sys).net.0.recv

#output prep
let full_user = $"($user)@ ($os_full_name) ($os_kernel_version)"
let full_cpu = $"CPU: ($cpu_name)"
let full_mem = $"Memory: ($mem_used) / ($mem_total)"
let full_net = $"Network: ($wifi_name) ↑($wifi_up) ↓($wifi_down)"

#acii art
if ((sys).host.long_os_version | str contains "Windows") {
    #acii art for windows logo
    let-env acii_art = "   Yb        dP w          8                       
    Yb  db  dP  w 8d8b. .d88 .d8b. Yb  db  dP d88b 
     YbdPYbdP   8 8P Y8 8  8 8' .8  YbdPYbdP  `Yb. 
      YP  YP    8 8   8 `Y88 `Y8P'   YP  YP   Y88P"
} else {
    let-env acii_art = $"    8     w                   
    8     w  8d8b.  8   8  Yb dP 
    8     8  8P Y8  8b d8   `8.  
    8888  8  8   8  `Y8P8  dP Yb"
}

#output
let full_output = $"($full_user)\n($full_cpu)\n($full_mem)\n($full_net)\n(ansi -e { fg: '#3cb371' })($env.acii_art)"
let $output = [[$"NuFetch v($nufetch_ver)"]; [$full_output];]
echo $output