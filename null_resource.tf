resource "null_resource" "ping_test" {
  count = 2

  provisioner "remote-exec" {
    inline = [
      # Crează scriptul de ping
      "echo '#!/bin/bash' > /home/adminuser/ping_script.sh",
      "echo 'TARGET_IP=\"10.123.1.5\"' >> /home/adminuser/ping_script.sh",
      "echo 'while true; do' >> /home/adminuser/ping_script.sh",
      "echo '    ping -c 4 $TARGET_IP >> /home/adminuser/ping_script.log 2>&1' >> /home/adminuser/ping_script.sh",
      "echo '    sleep 10' >> /home/adminuser/ping_script.sh",
      "echo 'done' >> /home/adminuser/ping_script.sh",
      "chmod +x /home/adminuser/ping_script.sh",
      "nohup /home/adminuser/ping_script.sh > /home/adminuser/ping_script.log 2>&1 &"
    ]

    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = random_password.password.result
      host        = element(azurerm_public_ip.mtc-ip[*].ip_address, count.index)
    }
  }
}

resource "null_resource" "check_ping_script" {
  count = 2

  provisioner "remote-exec" {
    inline = [
      "ps aux | grep 'ping_script.sh' >> /home/adminuser/ping_script_status.log",
      "echo 'Ping script status logged.' >> /home/adminuser/ping_script_status.log"
    ]

    connection {
      type        = "ssh"
      user        = "adminuser"
      password    = random_password.password.result
      host        = element(azurerm_public_ip.mtc-ip[*].ip_address, count.index)
    }
  }
}
