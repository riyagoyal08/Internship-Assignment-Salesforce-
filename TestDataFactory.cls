public class TestDataFactory {
    
    public static List<Lead> createLeads(Integer nOfLeads,Boolean isInsert){
        
        List<Lead> leadsToInsert = new List<Lead>();
        for(Integer i = 0; i < nOfLeads; i++){
            Lead l = new Lead();
            l.LastName = 'Test'+i;
            l.Company = 'Test Company';
            leadsToInsert.add(l);
        }
        if(!isInsert){
            return leadsToInsert;
        }
        insert leadsToInsert;
        return leadsToInsert;
    }
    
}