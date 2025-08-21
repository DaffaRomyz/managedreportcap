using CatalogService as service from '../../srv/cat-service';
annotate service.OrderItems with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : book_ID,
            Label : 'book_ID',
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
    ],
    UI.SelectionFields : [
        book_ID,
    ],
    Aggregation: {
        ApplySupported           : {
            $Type              : 'Aggregation.ApplySupportedType',
            AggregatableProperties : [
                {
                    $Type : 'Aggregation.AggregatablePropertyType',
                    Property : amount,
                }, 
                {
                    $Type : 'Aggregation.AggregatablePropertyType',
                    Property : quantity,
                },
            ],
            GroupableProperties: [
                ID,
                book_ID
            ]
        },
        CustomAggregate #amount  : 'Edm.Decimal',
        CustomAggregate #quantity: 'Edm.Int'
    },
    UI.Chart #alpChart : {
        $Type : 'UI.ChartDefinitionType',
        ChartType : #Column,
        Dimensions : [
            book_ID,
        ],
        Measures : [
            quantity,
            amount,
        ],
    },
    UI.SelectionPresentationVariant #alpChart : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.Chart#alpChart',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
    },
) {
    amount    @Analytics.Measure  @Aggregation.default: #SUM  @Measures.ISOCurrency: currency_code;
    quantity  @Analytics.Measure  @Aggregation.default: #SUM;
    book  @Common.Text: book.title;
    currency @Semantics.currencyCode;
};

annotate service.OrderItems with {
    book @Common.Label : 'book_ID'
};

