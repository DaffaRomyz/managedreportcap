using CatalogService as service from '../../srv/cat-service';
using from '../../db/schema';

annotate service.Orders with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : OrderNo,
        },
        {
            $Type : 'UI.DataField',
            Value : buyer,
        },
        {
            $Type : 'UI.DataField',
            Value : total,
            Label : 'total',
        },
    ],
    UI.SelectionFields : [
        OrderNo,
        buyer,
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General',
            ID : 'General',
            Target : '@UI.FieldGroup#General',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            ID : 'Items',
            Target : 'Items/@UI.LineItem#Items',
        },
    ],
    UI.FieldGroup #General : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OrderNo,
            },
            {
                $Type : 'UI.DataField',
                Value : buyer,
            },
            {
                $Type : 'UI.DataField',
                Value : total,
                Label : 'total',
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
            },
        ],
    },
    Aggregation: {
        ApplySupported        : {
            $Type              : 'Aggregation.ApplySupportedType',
            AggregatableProperties : [
                {
                    $Type : 'Aggregation.AggregatablePropertyType',
                    Property : total,
                },
            ],
            GroupableProperties: [
                buyer,
                OrderNo
            ]
        },
        CustomAggregate #total: 'Edm.Decimal'
    },
    UI.SelectionPresentationVariant #table : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
            SortOrder : [
                {
                    $Type : 'Common.SortOrderType',
                    Property : OrderNo,
                    Descending : false,
                },
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
);

annotate service.Orders with {
    total  @Analytics.Measure  @Aggregation.default: #SUM  
};

annotate service.OrderItems with @(
    UI.LineItem #Items : [
        {
            $Type : 'UI.DataField',
            Value : book.title,
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : amount,
            Label : 'amount',
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
    ]
);

