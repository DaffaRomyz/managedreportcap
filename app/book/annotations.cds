using CatalogService as service from '../../srv/cat-service';
annotate service.Books with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : 'title',
        },
        {
            $Type : 'UI.DataField',
            Value : descr,
            Label : 'descr',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : currency_code,
        },
        {
            $Type : 'UI.DataField',
            Value : author_ID,
        },
    ],
    UI.SelectionFields : [
        title,
        stock,
        genre_ID,
        price,
        author_ID,
    ],
);

annotate service.Books with {
    title @Common.Label : 'title'
};

annotate service.Books with {
    stock @Common.Label : 'stock'
};

annotate service.Books with {
    genre @Common.Label : 'genre_ID'
};

annotate service.Books with {
    price @Common.Label : 'price'
};

annotate service.Books with {
    author @(
        Common.Label : 'author_ID',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Authors',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : author_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'name',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
        Common.Text : author.name,
        Common.Text.@UI.TextArrangement : #TextOnly,
        )
};

