if ("/windows" | path exists) {
    let os_name = "Windows"
} else if ("/sys" | path exists) {
    let os_name = "Linux"
} else {
    let os_name = "Unknown"
    echo "Your $os_name OS is not supported by this script."
}