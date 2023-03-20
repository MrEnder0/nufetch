use nufetch_config.nu *

let-env nufetch_ver = "2023-005"

#sysinfo vars
let os_full_name = (sys).host.long_os_version
let os_kernel_version = (sys).host.kernel_version
let user = (sys).host.hostname
#let boot_time = (sys).host.boot_time

#cpu vars
let cpu_name = (sys).cpu.0.brand
let cpu_core_count = ((sys).cpu | length)

#mem vars
let mem_total = (sys).mem.total
let mem_used = (sys).mem.used

#wifi vars
let wifi_name = (sys).net.0.name
let wifi_up = (sys).net.0.sent
let wifi_down = (sys).net.0.recv

#output prep
let full_user = $"(ansi -e { fg: $env.accent_hex })($user)(ansi reset)@($os_full_name) ($os_kernel_version)"
let full_cpu = $"(ansi -e { fg: $env.accent_hex })CPU: (ansi reset)($cpu_name)" + $" (ansi -e { fg: $env.accent_hex })[(ansi reset)($cpu_core_count)(ansi -e { fg: $env.accent_hex })](ansi reset)"
let full_mem = $"(ansi -e { fg: $env.accent_hex })Memory: (ansi reset)($mem_used) (ansi -e { fg: $env.accent_hex })/(ansi reset) ($mem_total)"
let full_net = $"(ansi -e { fg: $env.accent_hex })Network: (ansi reset)($wifi_name) (ansi -e { fg: $env.accent_hex })↑(ansi reset)($wifi_up) (ansi -e { fg: $env.accent_hex })↓(ansi reset)($wifi_down)"

#acii art
if ((sys).host.long_os_version | str contains "Windows") {
    #acii art for windows logo
    let-env acii_art = "   Yb        dP  w            8                       
    Yb  db  dP   w  8d8b.  .d88  .d8b.  Yb  db  dP  d88b 
     YbdPYbdP    8  8P Y8  8  8  8' .8   YbdPYbdP   `Yb. 
      YP  YP     8  8   8  `Y88  `Y8P'    YP  YP    Y88P"
} else if ((sys).host.long_os_version | str contains "Linux") {
    let-env acii_art = $"    8     w                   
    8     w  8d8b.  8   8  Yb dP 
    8     8  8P Y8  8b d8   `8.  
    8888  8  8   8  `Y8P8  dP Yb"
} else {
    let-env ascii_art = " \n"
    echo "Unknown OS found leaving ascii art blank."
}

#output
let full_output = $"($full_user)\n($full_cpu)\n($full_mem)\n($full_net)\n(ansi -e { fg: $env.accent_hex })($env.acii_art)"
let $output = [[$"NuFetch v($env.nufetch_ver)"]; [$full_output];]
echo $output