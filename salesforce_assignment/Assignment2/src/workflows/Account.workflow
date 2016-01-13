<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Notify_Account_Owner_On_it_s_record_updated</fullName>
        <description>Notify Account Owner On it&apos;s record updated</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Notify_Account_Owner</template>
    </alerts>
    <fieldUpdates>
        <fullName>Set_Type_Field</fullName>
        <field>Type</field>
        <literalValue>Pending</literalValue>
        <name>Set Type Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_Customer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Type Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_Prospect</fullName>
        <field>Type</field>
        <literalValue>Prospect</literalValue>
        <name>Type Prospect</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_To_Customer</fullName>
        <field>Type</field>
        <literalValue>Customer</literalValue>
        <name>Type To Customer</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Notify Account Owner</fullName>
        <actions>
            <name>Notify_Account_Owner_On_it_s_record_updated</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notify the account owner when someone else updates the account if the account&apos;s annual revenue is greater than $1,000,000.</description>
        <formula>AND(LastModifiedBy.Username  &lt;&gt;  Owner.Username , AnnualRevenue  &gt; 1000000)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
