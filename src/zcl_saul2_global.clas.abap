CLASS zcl_saul2_global DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

*  PROTECTED SECTION.
*  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_saul2_global IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: connections TYPE TABLE OF REF TO lcl_connection.

    DATA(connection) = NEW lcl_connection( ).
    connection->set_attributes(
      i_carrier_id    = 'LH'
      i_connection_id = '0400'
    ).
    connections = VALUE #( BASE connections ( connection ) ).

    connection = NEW #( ).
    connection->set_attributes(
      i_carrier_id    = 'AA'
      i_connection_id = '0017'
    ).
    connections = VALUE #( BASE connections ( connection ) ).

    LOOP AT connections ASSIGNING FIELD-SYMBOL(<connection>).
      <connection>->get_attributes(
        IMPORTING
          e_carrier_id    = DATA(carr_id)
          e_connection_id = DATA(conn_id)
      ).

      out->write( |These Hoes Real Loyal: { carr_id } { conn_id } | ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
