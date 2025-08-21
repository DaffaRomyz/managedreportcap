using CatalogService as service from '../../srv/cat-service';

annotate service.OrderItems with @(
    UI.Chart #sumQtyChart           : {
        $Type     : 'UI.ChartDefinitionType',
        ChartType : #Bar,
        Title : 'Total Quantity',
        Description : 'Quantity Info',
        Measures  : [quantity],
        MeasureAttributes : [
            {
                $Type : 'UI.ChartMeasureAttributeType',
                Measure : quantity,
                Role : #Axis1,
            },
        ],
    },
    UI.PresentationVariant #sumQtyPV: {
        $Type         : 'UI.PresentationVariantType',
        Visualizations: [
            ![@UI.Chart#sumQtyChart]
        ],
        Text          : 'Qty Sum'
    },
    UI.DataPoint #sumQtyDP          : {
        $Type: 'UI.DataPointType',
        Value: quantity
    },
    UI.KPI #KPIQuantity             : {
        $Type           : 'UI.KPIType',
        SelectionVariant: {
            Text : 'quantity',
            $Type        : 'UI.SelectionVariantType',
            SelectOptions: [{
                PropertyName: quantity,
                Ranges      : [{
                    Sign  : #I,
                    Option: #GT,
                    Low   : '0'
                }]
            }]
        },
        DataPoint       : ![@UI.DataPoint#sumQtyDP],
        Detail          : {DefaultPresentationVariant: ![@UI.PresentationVariant#sumQtyPV]}
    }
);
