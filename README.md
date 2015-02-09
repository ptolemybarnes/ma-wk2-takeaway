# Takeaway, in Ruby
### by Ptolemy Barnes

This takeaway-ordering application interacts with the Twilio API, allowing users to receive an SMS confirmation of their order with details. Takeaway shows use of multiple classes and the Twilio API.

### Challenge

Tasks:
**Users** *read* **menus** and can *place* an order. The **menu** *matches* the order to its list of dishes, confirming availability and price. If these conditions are satisfied, the **menu** *sends* a confirmation message back to the **user**, which is relayed to the **user's** **phone**. The **phone** sends the message to a real phone number.


### Class Responsibility Cards

## Menu

| Responsibility | Collaborator         |
|----------------|---------------------:|
| Take order     | User                 |
| Send message   | User                 |
| Validate order |                      |

## User

| Responsibility | Collaborator         |
|----------------|---------------------:|
| Place order    | Menu                 |
| Receive message| Menu, Phone          |

## Phone

| Responsibility | Collaborator         |
|----------------|---------------------:|
| Relay message  | User                 |