# WhatsApp AutoBot

A Python-based WhatsApp bot that sends random Hadiths using the Twilio API. The bot is deployed on an AWS EC2 instance, and the infrastructure is managed using Terraform.

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Directory Structure](#directory-structure)
- [Setup Instructions](#setup-instructions)

## Project Overview

This project allows users to send a message to a WhatsApp number, and the bot responds with a random Hadith. The bot is built using Flask and integrates with the Twilio API to send messages via WhatsApp. The infrastructure is automated using Terraform to provision an EC2 instance on AWS.

## Technologies Used

- **Backend**: Python (Flask)
- **API**: Twilio API (for WhatsApp messaging)
- **Cloud Provider**: AWS EC2
- **Infrastructure as Code**: Terraform
- **Other Tools**: pip

## Directory Structure

```plaintext
whatsapp-autobot/
├── myscript.py                    # Python script for the bot logic and handling WhatsApp messages
├── terraform/                     # Terraform directory for provisioning infrastructure
│   ├── auto_var.auto.tfvars        # Variable values for Terraform (e.g.,vpc_cidr_block )
│   ├── inventory.ini              # Inventory for contain ip of ubuntu 
│   ├── main.tf                    # Main Terraform configuration for provisioning EC2
│   ├── modules/                   # Custom Terraform modules
│   │   ├── ec2/                   # EC2-related Terraform code
│   │   │   ├── main.tf            # EC2 module main configuration
│   │   │   ├── outputs.tf         # Outputs from the EC2 module
│   │   │   ├── public_user_data.sh # User data script for EC2 (installing dependencies, etc.)
│   │   │   └── variables.tf       # EC2 module variables
│   │   └── vpc/                   # VPC-related Terraform code
│   │       ├── main.tf            # VPC module main configuration
│   │       ├── outputs.tf         # Outputs from the VPC module
│   │       └── variables.tf       # VPC module variables
│   ├── outputs.tf                 # Terraform outputs file
│   ├── providers.tf               # Provider configurations (e.g., AWS provider)
│   └── variables.tf               # Global variables for Terraform
└── README.md                      # Project documentation
 ```
## Setup Instructions

1. **Clone the repository:**
    ```bash
    git clone https://github.com/<your-github-username>/whatsapp-autobot.git
    cd whatsapp-autobot
    ```


2. **Configure Twilio:**
    - Create an account on [Twilio](https://www.twilio.com).
    - Navigate to the **Twilio Console** and go to **Messaging** > **Try it Out** > **Send a WhatsApp message**.
    - Send a message from WhatsApp to `+1 415 523 8886` with the code `join himself-bend` to join the sandbox.
    - After joining, go to **Sandbox Settings** in the Twilio Console.
    - Under **Sandbox settings**, configure the webhook URL to your server's endpoint: `http://<your-server-ip>:8080/`.

    > **Note:** Replace `<your-server-ip>` with your actual server IP address.

3. **Deploy the infrastructure using Terraform:**
    - Ensure you have [Terraform](https://www.terraform.io/downloads.html) installed.
    - Navigate to the `terraform` directory and initialize Terraform:
      ```bash
      cd terraform
      terraform init
      ```
    - Apply the Terraform configuration to provision the EC2 instance:
      ```bash
      terraform apply
      ```

4. **Access the EC2 instance:**
    After Terraform finishes provisioning, SSH into the EC2 instance:
    ```bash
    ssh -i <your-ec2-key-pair>.pem ubuntu@<your-ec2-public-ip>
    ```

5. **Install required Python packages:**
    After setting up the instance, run the following commands to install Python dependencies and set up your environment:

    ```bash
    # Install required Python packages
    sudo apt install -y python3-pip python3.12-venv

    # Create a directory for your bot and navigate to it
    mkdir -p bot_dir && cd bot_dir

    # Create a Python virtual environment
    python3 -m venv bot_dir-env

    # Activate the virtual environment
    source bot_dir-env/bin/activate

    # Install necessary Python libraries
    pip install twilio flask requests

    # Run your script
    python3 myscript.py
    ```

6. **Run the Flask application:**
    After the environment setup, the bot should start running. You can verify that the application is working by sending a WhatsApp message to the Twilio sandbox number.

7. **Verify the bot is working:**
    - Send a message saying "اخبرني حديث" to the Twilio WhatsApp sandbox number.
    - You should receive a random Hadith in response.

## Flask Application

The Flask app listens for incoming WhatsApp messages and responds with a random Hadith when the user sends the phrase "اخبرني حديث". Below is the main script (`myscript.py`) that handles the logic

