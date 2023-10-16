# This code sample uses the 'requests' library:
# http://docs.python-requests.org
import requests
import json

from requests.auth import HTTPBasicAuth

from jira_api.jira_config import jira_config

jira = jira_config()
print(jira.url)
print(jira.password)

url = jira.url +"/rest/api/2/dashboard"

auth = HTTPBasicAuth(jira.username, jira.password)

headers = {
  "Accept": "application/json"
}

response = requests.request(
   "GET",
   url,
   headers=headers,
   auth=auth
)

print(json.dumps(json.loads(response.text), sort_keys=True, indent=4, separators=(",", ": ")))