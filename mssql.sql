CREATE TABLE [dbo].[si_companies](
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](250) NOT NULL,
    [address] [nvarchar](250) NULL,
    [zip] [nvarchar](50) NULL,
    [city] [nvarchar](250) NULL,
 CONSTRAINT [PK_si_companies] PRIMARY KEY CLUSTERED (
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_vendors](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](250) NOT NULL,
    [address] [nvarchar](250) NULL,
    [zip] [nvarchar](50) NULL,
    [city] [nvarchar](250) NULL,
    [country] [nvarchar](250) NULL,
    [email] [nvarchar](250) NULL,
    [vat_id] [nvarchar](250) NULL,
    [tax_id] [nvarchar](250) NULL,
 CONSTRAINT [PK_si_vendors] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_vendor_bank_accounts](
    [company_id] [nvarchar](50) NOT NULL,
    [vendor_id] [nvarchar](50) NOT NULL,
    [bank_code] [nvarchar](50) NULL,
    [bank_account] [nvarchar](50) NULL,
    [iban] [nvarchar](50) NULL,
    [bic] [nvarchar](50) NULL,
    [primary] [int] NULL
)
GO
 
CREATE TABLE [dbo].[si_tax_codes](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [percentage] [decimal](5, 2) NOT NULL,
 CONSTRAINT [PK_si_tax_codes] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_currencies](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [code] [nvarchar](50) NULL,
 CONSTRAINT [PK_si_currencies] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_document_types](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_si_document_types] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_payment_terms](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [net_days] [int] NULL,
    [cashback_days] [int] NULL,
    [cachback_percentage] [decimal](5, 2) NULL,
 CONSTRAINT [PK_si_payment_terms] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_vendor_payment_terms](
    [company_id] [nvarchar](50) NOT NULL,
    [vendor_id] [nvarchar](50) NOT NULL,
    [payment_terms_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_si_vendor_payment_terms] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [vendor_id] ASC
))
GO
 
CREATE TABLE [dbo].[si_accounts](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_si_accounts] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
 
CREATE TABLE [dbo].[si_dimensions](
    [company_id] [nvarchar](50) NOT NULL,
    [dimension_type] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [parent_dimension_type] [nvarchar](50) NULL,
    [parent_dimension_id] [nvarchar](50) NULL,
 CONSTRAINT [PK_si_dimensions] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [dimension_type] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_orders](
    [company_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [nr] [nvarchar](50) NOT NULL,
    [name] [nvarchar](50) NOT NULL,
    [vendor_id] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_si_orders] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [id] ASC
))
GO
 
CREATE TABLE [dbo].[si_order_lines](
    [company_id] [nvarchar](50) NOT NULL,
    [purchase_order_id] [nvarchar](50) NOT NULL,
    [id] [nvarchar](50) NOT NULL,
    [line_no] [int] NOT NULL,
    [item] [nvarchar](50) NOT NULL,
    [quantity_ordered] [int] NOT NULL,
    [quantity_received] [int] NOT NULL,
    [quantity_not_invoiced] [int] NOT NULL,
    [description] [nvarchar](250) NULL,
    [subtotal] [decimal](18, 2) NOT NULL,
    [unit] [nvarchar](50) NOT NULL,
    [unit_price] [decimal](18, 2) NOT NULL,
    [packing_unit] [decimal](18, 2) NOT NULL,
    [gl_account] [nvarchar](50) NULL,
    [cost_center] [nvarchar](50) NULL,
    [cost_unit] [nvarchar](50) NULL,
    [tax_id] [nvarchar](50) NULL,
    [custom1] [nvarchar](50) NULL,
    [custom2] [nvarchar](50) NULL,
    [custom3] [nvarchar](50) NULL,
    [custom4] [nvarchar](50) NULL,
    [custom5] [nvarchar](50) NULL,
    [custom6] [nvarchar](50) NULL,
    [custom7] [nvarchar](50) NULL,
    [custom8] [nvarchar](50) NULL,
    [custom9] [nvarchar](50) NULL,
    [custom10] [nvarchar](50) NULL,
 CONSTRAINT [PK_si_order_lines] PRIMARY KEY CLUSTERED (
    [company_id] ASC,
    [purchase_order_id] ASC,
    [id] ASC
))
GO

CREATE TABLE [dbo].[si_invoice_line_items](
    [doc_id] [nvarchar](20) NOT NULL,
    [internal_id] [nvarchar](50) NOT NULL,
    [line_no] [int] NOT NULL,
    [factually_verified_by] [nvarchar](50) NULL,
    [factually_verified_at] [datetime] NULL,
    [net_amount] [decimal](18, 2) NULL,
    [gross_amount] [decimal](18, 2) NULL,
    [tax_code] [nvarchar](50) NULL,
    [gl_account] [nvarchar](50) NULL,
    [cost_center] [nvarchar](50) NULL,
    [cost_unit] [nvarchar](50) NULL,
    [cash_discount] [int] NULL,
    [pay_amount] [decimal](18, 2) NULL,
    [posting_text] [nvarchar](250) NULL,
    [custom1] [nvarchar](250) NULL,
    [custom2] [nvarchar](250) NULL,
    [custom3] [nvarchar](250) NULL,
    [custom4] [nvarchar](250) NULL,
    [custom5] [nvarchar](250) NULL,
    [custom6] [nvarchar](250) NULL,
    [custom7] [nvarchar](250) NULL,
    [custom8] [nvarchar](250) NULL,
    [custom9] [nvarchar](250) NULL,
    [custom10] [nvarchar](250) NULL,
    [d3_status] [nvarchar](250) NULL,
    [d3_tstamp] [datetime] NOT NULL,
    [ext_status] [nvarchar](250) NULL,
    [ext_tstamp] [datetime] NULL,
    [ext_processed] [int] NOT NULL,
    [deleted] [int] NULL
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[si_invoice_line_items_log](
    [doc_id] [nvarchar](20) NOT NULL,
    [internal_id] [nvarchar](50) NOT NULL,
    [line_no] [int] NOT NULL,
    [factually_verified_by] [nvarchar](50) NULL,
    [factually_verified_at] [datetime] NULL,
    [net_amount] [decimal](18, 2) NULL,
    [gross_amount] [decimal](18, 2) NULL,
    [tax_code] [nvarchar](50) NULL,
    [gl_account] [nvarchar](50) NULL,
    [cost_center] [nvarchar](50) NULL,
    [cost_unit] [nvarchar](50) NULL,
    [cash_discount] [int] NULL,
    [pay_amount] [decimal](18, 2) NULL,
    [posting_text] [nvarchar](250) NULL,
    [custom1] [nvarchar](250) NULL,
    [custom2] [nvarchar](250) NULL,
    [custom3] [nvarchar](250) NULL,
    [custom4] [nvarchar](250) NULL,
    [custom5] [nvarchar](250) NULL,
    [custom6] [nvarchar](250) NULL,
    [custom7] [nvarchar](250) NULL,
    [custom8] [nvarchar](250) NULL,
    [custom9] [nvarchar](250) NULL,
    [custom10] [nvarchar](250) NULL,
    [d3_status] [nvarchar](250) NULL,
    [d3_tstamp] [datetime] NOT NULL,
    [ext_status] [nvarchar](250) NULL,
    [ext_tstamp] [datetime] NULL,
    [ext_processed] [int] NOT NULL,
    [deleted] [int] NULL
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[si_invoices](
    [doc_id] [nvarchar](20) NOT NULL,
    [company] [nvarchar](50) NOT NULL,
    [vendor] [nvarchar](50) NOT NULL,
    [net_amount] [decimal](18, 2) NOT NULL,
    [tax_amount] [decimal](18, 2) NOT NULL,
    [gross_amount] [decimal](18, 2) NOT NULL,
    [currency] [nvarchar](20) NULL,
    [external_number] [nvarchar](50) NULL,
    [internal_number] [nvarchar](50) NULL,
    [invoice_date] [datetime] NULL,
    [payment_date] [datetime] NULL,
    [posting_period] [nvarchar](50) NULL,
    [barcode] [nvarchar](50) NULL,
    [city] [nvarchar](50) NULL,
    [document_type] [nvarchar](50) NULL,
    [payment_terms] [nvarchar](50) NULL,
    [iban] [nvarchar](50) NULL,
    [bic] [nvarchar](50) NULL,
    [account_holder] [nvarchar](50) NULL,
    [posting_text] [nvarchar](250) NULL,
    [workflow_status] [nvarchar](100) NULL,
    [custom1] [nvarchar](250) NULL,
    [custom2] [nvarchar](250) NULL,
    [custom3] [nvarchar](250) NULL,
    [custom4] [nvarchar](250) NULL,
    [custom5] [nvarchar](250) NULL,
    [custom6] [nvarchar](250) NULL,
    [custom7] [nvarchar](250) NULL,
    [custom8] [nvarchar](250) NULL,
    [custom9] [nvarchar](250) NULL,
    [custom10] [nvarchar](250) NULL,
    [custom11] [nvarchar](250) NULL,
    [custom12] [nvarchar](250) NULL,
    [custom13] [nvarchar](250) NULL,
    [custom14] [nvarchar](250) NULL,
    [custom15] [nvarchar](250) NULL,
    [custom16] [nvarchar](250) NULL,
    [custom17] [nvarchar](250) NULL,
    [custom18] [nvarchar](250) NULL,
    [custom19] [nvarchar](250) NULL,
    [custom20] [nvarchar](250) NULL,
    [d3_status] [nvarchar](250) NULL,
    [d3_tstamp] [datetime] NOT NULL,
    [ext_status] [nvarchar](250) NULL,
    [ext_tstamp] [datetime] NULL,
    [ext_processed] [int] NOT NULL,
    [pay_amount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO
 
CREATE TABLE [dbo].[si_invoices_log](
    [doc_id] [nvarchar](20) NOT NULL,
    [company] [nvarchar](50) NOT NULL,
    [vendor] [nvarchar](50) NOT NULL,
    [net_amount] [decimal](18, 2) NOT NULL,
    [tax_amount] [decimal](18, 2) NOT NULL,
    [gross_amount] [decimal](18, 2) NOT NULL,
    [currency] [nvarchar](20) NULL,
    [external_number] [nvarchar](50) NULL,
    [internal_number] [nvarchar](50) NULL,
    [invoice_date] [datetime] NULL,
    [payment_date] [datetime] NULL,
    [posting_period] [nvarchar](50) NULL,
    [barcode] [nvarchar](50) NULL,
    [city] [nvarchar](50) NULL,
    [document_type] [nvarchar](50) NULL,
    [payment_terms] [nvarchar](50) NULL,
    [iban] [nvarchar](50) NULL,
    [bic] [nvarchar](50) NULL,
    [account_holder] [nvarchar](50) NULL,
    [posting_text] [nvarchar](250) NULL,
    [workflow_status] [nvarchar](100) NULL,
    [custom1] [nvarchar](250) NULL,
    [custom2] [nvarchar](250) NULL,
    [custom3] [nvarchar](250) NULL,
    [custom4] [nvarchar](250) NULL,
    [custom5] [nvarchar](250) NULL,
    [custom6] [nvarchar](250) NULL,
    [custom7] [nvarchar](250) NULL,
    [custom8] [nvarchar](250) NULL,
    [custom9] [nvarchar](250) NULL,
    [custom10] [nvarchar](250) NULL,
    [custom11] [nvarchar](250) NULL,
    [custom12] [nvarchar](250) NULL,
    [custom13] [nvarchar](250) NULL,
    [custom14] [nvarchar](250) NULL,
    [custom15] [nvarchar](250) NULL,
    [custom16] [nvarchar](250) NULL,
    [custom17] [nvarchar](250) NULL,
    [custom18] [nvarchar](250) NULL,
    [custom19] [nvarchar](250) NULL,
    [custom20] [nvarchar](250) NULL,
    [d3_status] [nvarchar](250) NULL,
    [d3_tstamp] [datetime] NOT NULL,
    [ext_status] [nvarchar](250) NULL,
    [ext_tstamp] [datetime] NULL,
    [ext_processed] [int] NOT NULL,
    [pay_amount] [decimal](18, 2) NULL
) ON [PRIMARY]
GO