*&---------------------------------------------------------------------*
*&  Include           Z_CONTROLO_DE_VOOS_DECLARACOES
*&---------------------------------------------------------------------*
TABLES zspfli_atrasos.
DATA  spfli TYPE spfli.

DATA: custom_container TYPE REF TO cl_gui_custom_container, "custom container -> refererência classe. não esquecer de criar o objecto no module.
      alv              TYPE REF TO cl_gui_alv_grid, "ref. alv grid -> não esquecer de criar o objecto no module.
      fieldcat         TYPE lvc_t_fcat. "Field catalog na call fuction

DATA it_spfli TYPE STANDARD TABLE OF spfli.
