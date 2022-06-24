*&---------------------------------------------------------------------*
*&  Include           Z_CONTROLO_DE_VOOS_PAI
*&---------------------------------------------------------------------*
MODULE pai INPUT.
  CASE sy-ucomm.
    WHEN 'VOLTAR' OR 'CANCELAR' OR 'SAIR'.
      LEAVE PROGRAM.
    WHEN 'EXEC'.
      SELECT *
 FROM spfli
 INTO TABLE it_spfli
 WHERE carrid IN s_carrid
 AND connid IN s_connid
 AND cityfrom IN s_cityfr
 AND cityto IN s_cityto.
    WHEN 'BTN_ATRASO'.

      DATA: wa_spfli         LIKE LINE OF it_spfli,
            wa_spfli_atrasos TYPE zspfli_atrasos.


      LOOP AT it_spfli INTO wa_spfli.
        wa_spfli_atrasos-carrid = wa_spfli-carrid.
        wa_spfli_atrasos-connid = wa_spfli-connid.
        wa_spfli_atrasos-dia_do_voo = zspfli_atrasos-dia_do_voo.
        wa_spfli_atrasos-atraso = zspfli_atrasos-atraso.

        INSERT zspfli_atrasos FROM wa_spfli_atrasos.

        IF sy-subrc = 0 .
          MESSAGE 'Registo inserido com sucesso.' TYPE 'S'.
        ELSE.
          MESSAGE 'Ocorreu um erro ao inserir registo.' TYPE 'S' DISPLAY LIKE 'E'.
        ENDIF.

      ENDLOOP.

  ENDCASE.
ENDMODULE.
