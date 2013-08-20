Handle the insertSubscriberData calls.

GSM MAP (09.02) wants us to avoid XUDT or segmented UDT messages. This means we will need to split the calls of insertSubscriberData to several calls to avoid running into that problem.

This class will make the decision on how to split things...