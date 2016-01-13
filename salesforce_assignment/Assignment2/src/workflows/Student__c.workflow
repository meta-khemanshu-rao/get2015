<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_email_to_student_on_its_records_updated</fullName>
        <description>Send email to student on its records updated</description>
        <protected>false</protected>
        <recipients>
            <field>email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/On_Update_Student</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_Marital_Status</fullName>
        <description>If any student have wife name then automatically its married = true.</description>
        <field>Married__c</field>
        <literalValue>YES</literalValue>
        <name>Change Marital Status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>EmailToStudentWhenUpdate</fullName>
        <actions>
            <name>Send_email_to_student_on_its_records_updated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Add a workflow rule to send an email to student when His record gets update. Email template in this case should have students className and contact name with it.</description>
        <formula>ISCHANGED( LastModifiedDate )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>marital status</fullName>
        <actions>
            <name>Change_Marital_Status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>If any student have wife name then automatically its married = true.</description>
        <formula>NOT( ISBLANK( WifeName__c ) )</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
