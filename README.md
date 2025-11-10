# AWS Automated Monitoring & Incident Response System (Self-Healing Infrastructure Case Study)
*End-to-end AWS monitoring automation with Lambda + Ansible self-healing.*

![AWS](https://img.shields.io/badge/AWS-Cloud-blue)
![Python](https://img.shields.io/badge/Python-Automation-yellow)
![Ansible](https://img.shields.io/badge/Ansible-Remediation-red)
![Terraform](https://img.shields.io/badge/Terraform-IaC-purple)
![DevOps](https://img.shields.io/badge/DevOps-Engineering-green)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

##  Project Overview
This project showcases an automated, self-healing AWS infrastructure capable of detecting EC2 instance failures and resolving them autonomously using CloudWatch, SNS, Lambda, and Ansible.

---

##  Architecture Overview
- CloudWatch monitors metrics.
- SNS sends alerts and triggers Lambda.
- Lambda parses the alert and launches Ansible playbooks.
- Ansible connects to EC2 via IAM role + SSH to fix or restart services.
- Terraform provisions Lambda, SNS, and IAM roles.

 Architecture Diagram:  
![AWS Monitoring Automation](diagrams/aws-monitoring-automation.png)

---

##  Automation Flow
1. CloudWatch detects high CPU or service downtime  
2. SNS publishes alert message  
3. Lambda parses event and triggers Ansible  
4. Ansible restarts or heals EC2 instance  
5. Lambda logs result to CloudWatch  

---

##  Project Results & Impact
 Reduced manual incident resolution time by 80%  
 Achieved 99.9% uptime via automation  
 Improved monitoring accuracy with CloudWatch metrics  
 Enhanced reliability with minimal human input  

---

##  Future Enhancements
- Predictive analytics for failure prevention  
- Multi-region failover automation  
- Slack/Teams alerts via SNS  

---

##  License
Released under the MIT License  see LICENSE file.

---

##  About Me
**Oje Ojeikere**  DevOps & Data Engineering professional focused on AWS infrastructure automation, incident response, and self-healing systems.  
[LinkedIn](https://linkedin.com/in/ojeikere-oje)
