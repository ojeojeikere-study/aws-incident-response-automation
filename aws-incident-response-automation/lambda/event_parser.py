import json
def parse_event(event):
    try:
        message = event['Records'][0]['Sns']['Message']
        details = json.loads(message)
        instance_id = details['Trigger']['Dimensions'][0]['value']
        print(f" Parsed instance ID: {instance_id}")
        return instance_id
    except Exception as e:
        print(f" Failed to parse event: {e}")
        return None
