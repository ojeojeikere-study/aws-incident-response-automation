import boto3
import subprocess
from event_parser import parse_event

def lambda_handler(event, context):
    instance_id = parse_event(event)
    if not instance_id:
        return {"status": "failed"}
    print(f" Starting remediation for {instance_id}")
    try:
        subprocess.run(
            ["ansible-playbook", "../ansible/restart_ec2_service.yml", "--extra-vars", f"target={instance_id}"],
            check=True
        )
        print(" Remediation executed successfully.")
    except Exception as e:
        print(f" Remediation failed: {e}")
