@isTest
public class UpdateLeadTest {
    
    @testsetup
    public static void testDataSetp(){
        List<Lead> leadsToTestPositive = TestDataFactory.createLeads(100, false);
        List<Lead> leadsToTestNegative = TestDataFactory.createLeads(10, true);
        
        for(Lead l: leadsToTestPositive){
            l.Country = 'US';
            l.City = 'New York';
        }
        insert leadsToTestPositive;
    }
    
    @isTest
    public static void leadUpdatesTestPositive(){
        
        Test.startTest();
        
        UpdateLead ul = new UpdateLead();
        Id jobId = database.executeBatch(ul);
        
        Test.stopTest();
        
        List<Lead> updatedLeads = [Select Rating,LeadSource from Lead where Country='US' and City='New York'];
        system.assertEquals(100, updatedLeads.size());
        system.assertEquals('Hot', updatedLeads.get(0).Rating);
        system.assertEquals('Web', updatedLeads.get(0).LeadSource);
        
    }
    
    @isTest
    public static void leadUpdatesTestNegative(){
        Test.startTest();
        
        UpdateLead ul = new UpdateLead();
        Id jobId = database.executeBatch(ul);
        
        Test.stopTest();
        
        List<Lead> updatedLeads = [Select Rating,LeadSource from Lead where Country != 'US' and City != 'New York'];
        
        system.assertEquals(10, updatedLeads.size());
        system.assertNotEquals('Hot', updatedLeads.get(0).Rating);
        system.assertNotEquals('Web', updatedLeads.get(0).LeadSource);
        
    }
    
}