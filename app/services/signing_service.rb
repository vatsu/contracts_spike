class SigningService
  def intiate_process(contract)
    signatories_data = contract.client.signatories.map do |s|
      { name: s.name, cpf: s.tax_id, email: s.email }
    end

    client_name = contract.client.name
    client_tax_id = contract.client.tax_id

    tax_id_type = if contract.client.segment == "company"
      "CNPJ"
    else
      "CPF"
    end

    #pdf = generate_pdf(product: contract.product.name,
    #                   client_name: client_name,
    #                   client_tax_id: client_tax_id,
    #                   tax_id_type: tax_id_type,
    #                   signatories: signatories_data)

    #SignServer::sign(contract.id,pdf,signatories_data)
  end

  def check_signing_process(contract)
    signatories = contract.client.signatories
    #data = SignServer::check_signing_process(contract_id)
    #if data.signed_count == signatories.count
    #  contract.status = "signed"
    #elsif 0 < data.signed_count
    #  contract.status = "partially_signed"
    #end
    contract.save
  end
end
