def number_of_bank_accounts( accounts )
  return accounts.length()
end

def first_bank_account_holder( accounts )
  return accounts[0]["holder_name"]
end

def bank_account_owner_names( accounts )
  bank_account_owner_names = Array.new()
  for account in accounts
    bank_account_owner_names.push(account["holder_name"])
  end
  return bank_account_owner_names
end

def total_cash_in_bank( accounts )
  total_cash_in_bank = 0
  for account in accounts
    total_cash_in_bank += account["amount"]
  end
  return total_cash_in_bank
end

def total_business_cash_in_bank( accounts )
  total_business_cash_in_bank = 0
  for account in accounts
    account_type = account["type"]
    if account_type == "business"
      total_business_cash_in_bank += account["amount"]
    end
  end
  return total_business_cash_in_bank
end

def average_bank_account_value( accounts )
  total_cash = 0
  average_value = 0
  for account in accounts
    total_cash += account["amount"]
    average_value = total_cash / accounts.length
  end
  return average_value
end

def find_accounts_by_risk( accounts, risk_level )
  returned_accounts = Array.new()
  for account in accounts
    if risk_level == "low"
      if account["stats"]["risk_level"] == "low"
        returned_accounts.push(account)
      end
    elsif risk_level == "medium"
      if account["stats"]["risk_level"] == "medium"
        returned_accounts.push(account)
      end
    elsif risk_level == "high"
      if account["stats"]["risk_level"] == "high"
        returned_accounts.push(account)
      end
    else returned_accounts = nil
    end
  end
  return returned_accounts
end

def name_of_largest_value_account_holder( accounts )
  account_value = 0
  account_holder_name = nil
  for account in accounts
    if account["amount"] > account_value
      account_value = account["amount"]
      account_holder_name = account["holder_name"]
    end
  end
  return account_holder_name
end

def name_of_largest_account_holder( accounts, bank_account_type)
  account_value = 0
  account_holder_name = nil
  for account in accounts
    if bank_account_type == "personal"
      if account["type"] == "personal" && account["amount"] > account_value
          account_value = account["amount"]
          account_holder_name = account["holder_name"]
      end
    elsif bank_account_type == "business"
      if account["type"] == "business" && account["amount"] > account_value
          account_value = account["amount"]
          account_holder_name = account["holder_name"]
      end
    end
  end
  return account_holder_name
end
