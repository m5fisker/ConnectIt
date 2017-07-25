// # Proxy Compiler 1.7.3.17

import Foundation
import SAPOData

open class MyPrefixPurchaseOrderHeader: EntityValue {
    public static let currencyCode: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "CurrencyCode")

    public static let grossAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "GrossAmount")

    public static let netAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "NetAmount")

    public static let purchaseOrderID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "PurchaseOrderId")

    public static let supplierID: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "SupplierId")

    public static let taxAmount: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "TaxAmount")

    public static let items: Property = MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader.property(withName: "Items")

    public init() {
        super.init(type: MyPrefixMyServiceClassMetadata.EntityTypes.purchaseOrderHeader)
    }

    open class func array(from: EntityValueList) -> [MyPrefixPurchaseOrderHeader] {
        return ArrayConverter.convert(from.toArray(), [MyPrefixPurchaseOrderHeader]())
    }

    open func copy() -> MyPrefixPurchaseOrderHeader {
        return CastRequired<MyPrefixPurchaseOrderHeader>.from(copyEntity())
    }

    open var currencyCode: String? {
        get {
            return StringValue.optional(optionalValue(for: MyPrefixPurchaseOrderHeader.currencyCode))
        }
        set(value) {
            setOptionalValue(for: MyPrefixPurchaseOrderHeader.currencyCode, to: StringValue.of(optional: value))
        }
    }

    open var grossAmount: BigDecimal? {
        get {
            return DecimalValue.optional(optionalValue(for: MyPrefixPurchaseOrderHeader.grossAmount))
        }
        set(value) {
            setOptionalValue(for: MyPrefixPurchaseOrderHeader.grossAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var items: [MyPrefixPurchaseOrderItem] {
        get {
            return ArrayConverter.convert(EntityValueList.castRequired(self.requiredValue(for: MyPrefixPurchaseOrderHeader.items)).toArray(), [MyPrefixPurchaseOrderItem]())
        }
        set(value) {
            MyPrefixPurchaseOrderHeader.items.setEntityList(in: self, to: EntityValueList.fromArray(ArrayConverter.convert(value, Array<EntityValue>())))
        }
    }

    open class func key(purchaseOrderID: String?) -> EntityKey {
        return EntityKey().with(name: "PurchaseOrderId", value: StringValue.of(optional: purchaseOrderID))
    }

    open var netAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.netAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.netAmount, to: DecimalValue.of(optional: value))
        }
    }

    open var old: MyPrefixPurchaseOrderHeader {
        return CastRequired<MyPrefixPurchaseOrderHeader>.from(self.oldEntity)
    }

    open var purchaseOrderID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.purchaseOrderID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.purchaseOrderID, to: StringValue.of(optional: value))
        }
    }

    open var supplierID: String? {
        get {
            return StringValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.supplierID))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.supplierID, to: StringValue.of(optional: value))
        }
    }

    open var taxAmount: BigDecimal? {
        get {
            return DecimalValue.optional(self.optionalValue(for: MyPrefixPurchaseOrderHeader.taxAmount))
        }
        set(value) {
            self.setOptionalValue(for: MyPrefixPurchaseOrderHeader.taxAmount, to: DecimalValue.of(optional: value))
        }
    }
}
