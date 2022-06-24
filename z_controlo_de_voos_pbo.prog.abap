*&---------------------------------------------------------------------*
*&  Include           Z_CONTROLO_DE_VOOS_PBO
*&---------------------------------------------------------------------*

MODULE pbo OUTPUT.

  DATA coluna LIKE LINE OF fieldcat.

  SET PF-STATUS '1000'.

  IF custom_container IS NOT BOUND.

    CREATE OBJECT custom_container
      EXPORTING
        container_name = 'CC_ALV'.

    CREATE OBJECT alv
      EXPORTING
        i_parent = custom_container.

    "montar estrutura
    CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
      EXPORTING
        i_structure_name = 'SPFLI' "estrutura spfli
      CHANGING
        ct_fieldcat      = fieldcat. "declarado no cabeçalho data // captura as colunas que queremos

    LOOP AT fieldcat INTO coluna .

      IF coluna-fieldname = 'DISTANCE' OR
          coluna-fieldname = 'DISTID' OR
            coluna-fieldname = 'FLTYPE' OR
               coluna-fieldname = 'PERIOD' .

        coluna-no_out = 'X' .

        MODIFY fieldcat FROM coluna .

      ENDIF .

    ENDLOOP .

    CALL METHOD alv->set_table_for_first_display "metódo para inicializar o alv dentro do container
      CHANGING
        it_outtab       = it_spfli "tabela de ref.
        it_fieldcatalog = fieldcat.

  ENDIF.

  CALL METHOD alv->refresh_table_display( ).

ENDMODULE.
