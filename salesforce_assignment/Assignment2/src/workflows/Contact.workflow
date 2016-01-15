<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Teacher_Having_Experience_5</fullName>
        <description>Notify Teacher Having Experience &gt; 5</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notify_Teacher</template>
    </alerts>
    <alerts>
        <fullName>Send_Birthday_Email</fullName>
        <description>Send Birthday Email</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Birthday_Mail_Template</template>
    </alerts>
    <rules>
        <fullName>Birthday Email</fullName>
        <actions>
            <name>Send_Birthday_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send an email to the contact two days before the contact&apos;s birthday.</description>
        <formula>AND(NOT( ISBLANK( Birthdate ) ), NOT( ISBLANK(  Email ) ))</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Contact.Birthdate</offsetFromField>
            <timeLength>2</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Send Experience Email</fullName>
        <actions>
            <name>Notify_Teacher_Having_Experience_5</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Experience__c</field>
            <operation>greaterThan</operation>
            <value>5</value>
        </criteriaItems>
        <description>Add workflow to teacher(insert/update) if his experience is more then 5 then send mail</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
