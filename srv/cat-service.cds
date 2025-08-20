using managedreport from '../db/schema';

service CatalogService {
    @readonly
    entity Books   as projection on managedreport.Books;

    @readonly
    entity Authors as projection on managedreport.Authors;

    @readonly
    // @Aggregation : { ApplySupported  : {
    //     $Type : 'Aggregation.ApplySupportedType',
    //     GroupableProperties : [
    //         buyer,
    //         OrderNo
    //     ],
    // },
    // CustomAggregate #total : 'Edm.Decimal',
    //  }
    entity Orders     as projection on managedreport.Orders;
}