using managedreport from '../db/schema';

service AdminService @(requires: 'admin') {
  entity Books   as projection on managedreport.Books;
  entity Authors as projection on managedreport.Authors;
}
