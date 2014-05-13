class Search
  include ActiveModel::Model

  attr_accessor :account_id, :transaction_type_id, :spend_category_id, :date_beg, :date_end, :to_or_from, :amount_beg, :amount_end, :cleared

  def persisted?
    false
  end

  def search_user_transactions(scope)
    add_scope_filters(scope)
  end

  private

    def account_id_scope(scope)
      if self.account_id.blank?
        scope
      else
        scope.where(account_id: self.account_id)
      end
    end

    def transaction_type_scope(scope)
      if self.transaction_type_id.blank?
        scope
      else
        scope.where(transaction_type_id: self.transaction_type_id)
      end
    end

    def spend_category_scope(scope)
      if self.spend_category_id.blank?
        scope
      else
        scope.where(spend_category_id: self.spend_category_id)
      end
    end

    def date_scope(scope)
      if self.date_beg.blank? && self.date_end.blank?
        scope
      elsif self.date_end.blank? && !self.date_beg.blank?
        scope.where("transaction_date >= '#{self.date_beg}'")
      elsif self.date_beg.blank? && !self.date_end.blank?
        scope.where("transaction_date <= '#{self.date_end}'")
      else
        scope.where("transaction_date >= '#{self.date_beg}' AND transaction_date <= '#{self.date_end}'")
      end
    end

    def to_or_from_scope(scope)
      if self.to_or_from.blank?
        scope
      else
        scope.where("to_or_from ILIKE '%#{self.to_or_from}%'")
      end
    end

    def amount_scope(scope)
      if self.amount_beg.blank? && self.amount_end.blank?
        scope
      elsif self.amount_end.blank?
        scope.where("amount >= #{self.amount_beg}")
      elsif self.amount_beg.blank?
        scope.where("amount <= #{self.amount_end}")
      else
        scope.where("amount >= #{self.amount_beg} AND amount <= #{self.amount_end}")
      end
    end

    def cleared_scope(scope)
      if self.cleared.blank?
        scope
      else
        scope.where(cleared: self.cleared)
      end
    end
    
    def add_scope_filters(scope)
      scope = account_id_scope(scope)
      scope = transaction_type_scope(scope)
      scope = spend_category_scope(scope)
      scope = date_scope(scope)
      scope = to_or_from_scope(scope)
      scope = amount_scope(scope)
      scope = cleared_scope(scope)
    end

end