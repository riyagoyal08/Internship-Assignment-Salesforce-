global class UpdateLead implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext bc)
    {
        return Database.getQueryLocator('Select Id, LeadSource, Rating from Lead Where Country=\'US\' AND City=\'New York\'');
    }
    global void execute(Database.BatchableContext bc, List<Lead> lList)
    {
        
        for(Lead l: lList)
        {
            l.LeadSource='Web';
            l.Rating='Hot';
        }
        update lList;
    }
    global void finish(Database.BatchableContext bc)
    {
        
    }

}