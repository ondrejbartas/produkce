module OperationTypesHelper
  def value(item)
    OperationType::TYPE_VALUES[item.value]
  end
end
