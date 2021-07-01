
using System;
using System.Runtime.Serialization;
using System.Data;
using System.Data.SqlClient;
using KAF.BusinessDataObjects.BusinessDataObjectsBase;

namespace KAF.BusinessDataObjects.BusinessDataObjectsPartials
{

	#region cor_maildistribution_Inbox_Summary
	/// <summary>
	/// This object represents the properties and methods of a cor_maildistribution_Inbox_Summary.
	/// </summary>
    [Serializable]
    [DataContract(Name = "cor_maildistribution_Inbox_SummaryEntity", Namespace = "http://www.KAF.com/types")]
	public class cor_maildistribution_Inbox_SummaryEntity : BaseEntity
	{
		    public long ? mailcontentid{ get; set; }
		    public string mailreferencenumber{ get; set; }
		    public string documentbarcode{ get; set; }
		    public string senderqrcode{ get; set; }
		    public string unitcode{ get; set; }
		    public long ? currentyear{ get; set; }
		    public long ? documentserial{ get; set; }
		    public string correspondancecode{ get; set; }
		    public bool isdraft{ get; set; }
		    public bool issent{ get; set; }
		    public string docname{ get; set; }
		    public string classification{ get; set; }
		    public string priorityname{ get; set; }
		    public string bcclist{ get; set; }
		    public string senderlist{ get; set; }
		    public string cclist{ get; set; }
		
		public cor_maildistribution_Inbox_SummaryEntity()
		{
		}
		
		public cor_maildistribution_Inbox_SummaryEntity(IDataReader ireader)
		{
			//LoadFromReader(ireader);
            LoadFromReaderREF(ireader);
		}
		
		protected void LoadFromReaderREF(IDataReader reader)
		{
			//SqlDataReader reader = (SqlDataReader)ireader;
			if (reader != null && !reader.IsClosed)
			{
				    if (!reader.IsDBNull(reader.GetOrdinal("MailContentID"))) mailcontentid = reader.GetInt64(reader.GetOrdinal("MailContentID"));
				    if (!reader.IsDBNull(reader.GetOrdinal("MailReferenceNumber"))) mailreferencenumber = reader.GetString(reader.GetOrdinal("MailReferenceNumber"));
				    if (!reader.IsDBNull(reader.GetOrdinal("DocumentBarCode"))) documentbarcode = reader.GetString(reader.GetOrdinal("DocumentBarCode"));
				    if (!reader.IsDBNull(reader.GetOrdinal("SenderQRCode"))) senderqrcode = reader.GetString(reader.GetOrdinal("SenderQRCode"));
				    if (!reader.IsDBNull(reader.GetOrdinal("UnitCode"))) unitcode = reader.GetString(reader.GetOrdinal("UnitCode"));
				    if (!reader.IsDBNull(reader.GetOrdinal("CurrentYear"))) currentyear = reader.GetInt64(reader.GetOrdinal("CurrentYear"));
				    if (!reader.IsDBNull(reader.GetOrdinal("DocumentSerial"))) documentserial = reader.GetInt64(reader.GetOrdinal("DocumentSerial"));
				    if (!reader.IsDBNull(reader.GetOrdinal("CorrespondanceCode"))) correspondancecode = reader.GetString(reader.GetOrdinal("CorrespondanceCode"));
				    if (!reader.IsDBNull(reader.GetOrdinal("IsDraft"))) isdraft = reader.GetBoolean(reader.GetOrdinal("IsDraft"));
				    if (!reader.IsDBNull(reader.GetOrdinal("IsSent"))) issent = reader.GetBoolean(reader.GetOrdinal("IsSent"));
				    if (!reader.IsDBNull(reader.GetOrdinal("DocName"))) docname = reader.GetString(reader.GetOrdinal("DocName"));
				    if (!reader.IsDBNull(reader.GetOrdinal("Classification"))) classification = reader.GetString(reader.GetOrdinal("Classification"));
				    if (!reader.IsDBNull(reader.GetOrdinal("PriorityName"))) priorityname = reader.GetString(reader.GetOrdinal("PriorityName"));
				    if (!reader.IsDBNull(reader.GetOrdinal("BccList"))) bcclist = reader.GetString(reader.GetOrdinal("BccList"));
				    if (!reader.IsDBNull(reader.GetOrdinal("SenderList"))) senderlist = reader.GetString(reader.GetOrdinal("SenderList"));
				    if (!reader.IsDBNull(reader.GetOrdinal("CcList"))) cclist = reader.GetString(reader.GetOrdinal("CcList"));
			}
		}
		
		
		
	}
	#endregion
    
}

    