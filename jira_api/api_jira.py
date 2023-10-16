from atlassian import Jira
from atlassian import Confluence
from atlassian import Crowd
from atlassian import Bitbucket
from atlassian import ServiceDesk
from atlassian import Xray
import json
import pprint
from jira_config import jira_config
from execution_config import execution_config
# jira = Jira(
#     url='https://squash123.atlassian.net',
#     username='mourtaji.y@gmail.com',
#     password='NEOcol0011')
# jira = Jira(
#     url='https://squash123.atlassian.net',
#     username='mourtaji.y@gmail.com',
#     password='ATATT3xFfGF0fel8fFGVpWbzl35S_xYElf4140FSUMvlc7aYK9vgdU5JigBCgDvwSunYHqQBoUydgsF1E8T6yOXWJ-6nF1LVTA1AninPAKtwBKGkiVnh9anhJ3qciRJGm3-H3cLwAakZeA52u7AzPvdG7n8Io2F5F2DcymuRe4ME-pUqmgVGcgU=E9A3F928',
#     cloud=True)
jira = jira_config()
conf = execution_config()


# jql_request = 'project = '+conf.project
# issues = jira.jira.jql(jql_request)
# pprint.pprint(issues)

# print('-------------')
# pprint.pprint(jira.projects(included_archived=None))
#
# print('-------------issues in board')
# pprint.pprint(jira.get_all_sprints_from_board(1, state=None, start=0, limit=50))
# print('-------------')
#
# pprint.pprint(jira.get_all_issues_for_sprint_in_board(1, state='active', start=0, limit=50))
# print('-------------')
#
#
#

# from robot.api.deco import keyword
# @keyword('Assign Jira Status')
# def change_status(key_tag, status):
#     if status=='PASS':
#         jira.set_issue_status(key_tag, 'DONE', fields=None)
#     else:
#         issue_dict = {
#             'project': {'key': 'RBF'},
#             'customfield_10020':1,
#             'summary': 'Testing issue from US for : RBF-2',
#             'description': 'Detailed ticket description.',
#             'issuetype': {'name': 'Bug'}
#         }
#         jira.create_issue(issue_dict)
#
#
issue_dict = {
            'project': {'key': 'RBF'},
            'customfield_10020':1,
            'summary': 'Testing issue from US for : RBF-2',
            'description': 'Detailed ticket description.',
            'issuetype': {'name': 'Bug'}
}
bug = jira.jira.issue_create(issue_dict)
pprint.pprint(bug)

# Create Issue Link
data = {
        "type": {"name": "Blocks" },
        "inwardIssue": { "key": "RBF-2"},
        "outwardIssue": {"key": bug.get("key")},
        "comment": { "body": "Linked related issue!"}
}
jira.jira.create_issue_link(data)

# pprint.pprint(jira.jira.get_all_agile_boards(board_name=None, project_key='RBF', board_type=None, start=0, limit=50))

# pprint.pprint(jira.jira.issue("RBF-2"))
