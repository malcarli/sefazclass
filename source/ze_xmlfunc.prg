/*
ZE_XMLFUNC - Fun��es pra trabalhar com XML
Jos� Quintas

2018.10.16 - Hor�rio de ver�o diferente em 2018
*/

#ifndef DOW_DOMINGO
#define DOW_DOMINGO 1
#endif

FUNCTION XmlTransform( cXml )

   LOCAL nCont, cRemoveTag, cLetra, nPos, lTroca, nAscii

   cRemoveTag := { ;
      [<?xml version="1.0" encoding="utf-8"?>], ; // Petrobras inventou de usar assim
      [<?xml version="1.0" encoding="ISO-8859-1"?>], ; // Petrobras agora assim
      [<?xml version="1.0" encoding="UTF-8"?>], ; // o mais correto
      [<?xml version="1.0" encoding="UTF-8" standalone="yes"?>], ;
      [<?xml version="1.00"?>], ;
      [<?xml version="1.0"?>] }

   cXml := AllTrim( cXml )
   FOR nCont = 1 TO Len( cRemoveTag )
      cXml := StrTran( cXml, cRemoveTag[ nCont ], "" )
   NEXT
   IF ! ["] $ cXml // Pode ser usado aspas simples
      cXml := StrTran( cXml, ['], ["] )
   ENDIF
   IF Chr(195) $ cXml
      nPos := At( Chr(195), cXml )
      IF Asc( Substr( cXml, nPos + 1 ) ) > 122
         cXml := hb_Utf8ToStr( cXml )
      ENDIF
   ENDIF
   FOR nCont = 1 TO 2
      cXml := StrTran( cXml, Chr(26), "" )
      cXml := StrTran( cXml, Chr(13), "" )
      cXml := StrTran( cXml, Chr(10), "" )
      IF Substr( cXml, 1, 1 ) $ Chr(239) + Chr(187) + Chr(191)
         cXml := Substr( cXml, 2 )
      ENDIF
      cXml := StrTran( cXml, " />", "/>" )
      cXml := StrTran( cXml, Chr(195) + Chr(173), "i" )
      cXml := StrTran( cXml, Chr(195) + Chr(135), "C" )
      cXml := StrTran( cXml, Chr(195) + Chr(141), "I" )
      cXml := StrTran( cXml, Chr(195) + Chr(163), "a" )
      cXml := StrTran( cXml, Chr(195) + Chr(167), "c" )
      cXml := StrTran( cXml, Chr(195) + Chr(161), "a" )
      cXml := StrTran( cXml, Chr(195) + Chr(131), "A" )
      cXml := StrTran( cXml, Chr(194) + Chr(186), "o." )
      cxml := StrTran( cxml, Chr(195) + Chr(162), "a" )
      cxml := StrTran( cxml, Chr(195) + Chr(161), "a" )
      cxml := StrTran( cxml, Chr(195) + Chr(163), "a" )
      cxml := StrTran( cxml, Chr(195) + Chr(173), "i" )
      cxml := StrTran( cxml, Chr(195) + Chr(179), "o" )
      cxml := StrTran( cxml, Chr(195) + Chr(167), "c" )
      cxml := StrTran( cxml, Chr(195) + Chr(169), "e" )
      cxml := StrTran( cxml, Chr(195) + Chr(170), "e" )
      cxml := StrTran( cxml, Chr(195) + Chr(181), "o" )
      cxml := StrTran( cxml, Chr(195) + Chr(160), "o" )
      cxml := StrTran( cxml, Chr(195) + Chr(181), "o" )
      cxml := StrTran( cxml, Chr(195) + Chr(129), "A" )
      cxml := StrTran( cxml, Chr(226) + Chr(128) + Chr(156), [*] ) // aspas de destaque "cames"
      cxml := StrTran( cxml, Chr(226) + Chr(128) + Chr(157), [*] ) // aspas de destaque "cames"
      cxml := StrTran( cxml, Chr(195) + Chr(180), "o" )
      cxml := StrTran( cxml, Chr(195) + Chr(186), "u" )
      cxml := StrTran( cxml, Chr(195) + Chr(147), "O" )
      cxml := StrTran( cxml, Chr(226) + Chr(128) + Chr(153), [ ] ) // caixa d'agua
      cxml := StrTran( cxml, Chr(226) + Chr(128) + Chr(147), [-] ) // - mesmo
      cxml := StrTran( cxml, Chr(194) + Chr(179), [3] ) // m3
      // so pra corrigir no SQL
      cXml := StrTran( cXml, "+" + Chr(129), "A" )
      cXml := StrTran( cXml, "+" + Chr(137), "E" )
      cXml := StrTran( cXml, "+" + Chr(131), "A" )
      cXml := StrTran( cXml, "+" + Chr(135), "C" )
      cXml := StrTran( cXml, "?" + Chr(167), "c" )
      cXml := StrTran( cXml, "?" + Chr(163), "a" )
      cXml := StrTran( cXml, "?" + Chr(173), "i" )
      cXml := StrTran( cXml, "?" + Chr(131), "A" )
      cXml := StrTran( cXml, "?" + Chr(161), "a" )
      cXml := StrTran( cXml, "?" + Chr(141), "I" )
      cXml := StrTran( cXml, "?" + Chr(135), "C" )
      cXml := StrTran( cXml, Chr(195) + Chr(156), "a" )
      cXml := StrTran( cXml, Chr(195) + Chr(159), "A" )
      cXml := StrTran( cXml, "?" + Chr(129), "A" )
      cXml := StrTran( cXml, "?" + Chr(137), "E" )
      cXml := StrTran( cXml, Chr(195) + "?", "C" )
      cXml := StrTran( cXml, "?" + Chr(149), "O" )
      cXml := StrTran( cXml, "?" + Chr(154), "U" )
      cXml := StrTran( cXml, "+" + Chr(170), "o" )
      cXml := StrTran( cXml, "?" + Chr(128), "A" )
      cXml := StrTran( cXml, Chr(195) + Chr(166), "e" )
      cXml := StrTran( cXml, Chr(135) + Chr(227), "ca" )
      cXml := StrTran( cXml, "n" + Chr(227), "na" )
      cXml := StrTran( cXml, Chr(162), "o" )
      cXml := StrTran( cXml, " " + Chr(241) + " ", " " )
      cXml := StrTran( cXml, Chr(176), "" ) // graus
      cXml := StrTran( cXml, Chr(186), "o" ) // numero
      cXml := StrTran( cXml, Chr(220), "U" ) // u com trema
      cXml := StrTran( cXml, Chr(170), "" ) // desconhecido
   NEXT
   FOR nCont = 1 TO Len( cXml )
      cLetra := Substr( cXml, nCont, 1 )
      nAscii := Asc( cLetra )
      lTroca := .T.
      DO CASE
      CASE cLetra $ "abcdefghijklmnopqrstuvwxyz"; lTroca := .F.
      CASE cLetra $ "ABCDEFGHIJKLMNOPQRSTUVWXYZ"; lTroca := .F.
      CASE cLetra $ "01234567889"; lTroca := .F.
      CASE cLetra $ ",.:/;%*$@?<>()+-#=:_" + Chr(34) + Chr(32); lTroca := .F.
      CASE nAscii == 231; cLetra := "c"
      CASE nAscii == 199; cLetra := "C"
      CASE hb_AScan( { 193, 194, 195, 192 }, nAscii ) != 0 ; cLetra := "A"
      CASE hb_AScan( { 224, 225, 226, 227, 228, 229 }, nAscii ) != 0 ; cLetra := "a"
      CASE hb_AScan( { 242, 243, 244, 245, 246 }, nAscii ) != 0 ; cLetra := "o"
      CASE hb_AScan( { 210, 211, 212, 213, 214 }, nAscii ) != 0 ; cLetra := "O"
      CASE hb_AScan( { 200, 201, 202, 203 }, nAscii ) != 0 ; cLetra := "E"
      CASE hb_AScan( { 232, 233, 234, 235 }, nAscii ) != 0 ; cLetra := "e"
      CASE hb_AScan( { 236, 237, 238, 239 }, nAscii ) != 0 ; cLetra := "i"
      CASE hb_AScan( { 204, 205, 206, 207 }, nAscii ) != 0 ; cLetra := "I"
      CASE hb_AScan( { 249, 250, 251, 252 }, nAscii ) != 0 ; cLetra := "u"
      CASE hb_AScan( { 217, 218, 219 }, nAscii ) != 0 ; cLetra := "U"
      CASE nAscii == 128 ; cLetra := "C" // experimental
      CASE nAscii == 144 ; cLetra := "E" // experimental
      CASE nAscii == 248 ; cLetra := "" // experimental
      CASE nAscii == 167 ; cLetra := "o" // experimental
      ENDCASE
      IF lTroca
         cXml := Substr( cXml, 1, nCont - 1 ) + cLetra + Substr( cXml, nCont + 1 )
      ENDIF
   NEXT

   RETURN cXml

FUNCTION XmlNode( cXml, cNode, lComTag )

   LOCAL nInicio, nFim, cResultado := ""

   hb_Default( @lComTag, .F. )
   nInicio := At( "<" + cNode, cXml )
   // a linha abaixo � depois de pegar o in�cio, sen�o falha
   IF " " $ cNode
      cNode := Substr( cNode, 1, At( " ", cNode ) - 1 )
   ENDIF
   IF nInicio != 0
      IF ! lComTag
         nInicio := nInicio + Len( cNode ) + 2
         IF nInicio != 1 .AND. Substr( cXml, nInicio - 1, 1 ) != ">" // Quando tem elementos no bloco
            nInicio := hb_At( ">", cXml, nInicio ) + 1
         ENDIF
      ENDIF
      nFim := hb_At( "</" + cNode + ">", cXml, nInicio )
      IF nFim != 0
         nFim -=1
         IF lComTag
            nFim := nFim + Len( cNode ) + 3
         ENDIF
         cResultado := Substr( cXml, nInicio, nFim - nInicio + 1 )
      ENDIF
   ENDIF

   RETURN cResultado

FUNCTION XmlElement( cXml, cElement )

   LOCAL nInicio, nFim, cResultado := ""

   nInicio := At( cElement + "=", cXml )
   IF nInicio != 0
      nInicio += 1
      nInicio := hb_At( "=", cXml, nInicio ) + 2
   ENDIF
   nFim    := hb_At( ["], cXml, nInicio ) - 1
   IF nInicio > 0 .AND. nFim > 0 .AND. nFim > nInicio
      cResultado := Substr( cXml, nInicio, nFim - nInicio + 1 )
   ENDIF

   RETURN cResultado

FUNCTION XmlDate( cData )

   LOCAL dDate

   dDate := Stod( Substr( cData, 1, 4 ) + Substr( cData, 6, 2 ) + Substr( cData, 9, 2 ) )

   RETURN dDate

FUNCTION XmlTag( cTag, xValue, nDecimals, lConvert )

   LOCAL cXml

   hb_Default( @nDecimals, 2 )
   hb_Default( @lConvert, .T. )

   IF lConvert
      IF ValType( xValue ) == "D"
         xValue := DateXml( xValue )
      ELSEIF ValType( xValue ) == "N"
         xValue := NumberXml( xValue, nDecimals )
      ELSE
         xValue := StringXML( xValue )
      ENDIF
   ENDIF
   IF Len( xValue ) == 0
      cXml := [<]+ cTag + [/>]
   ELSE
      cXml := [<] + cTag + [>] + xValue + [</] + cTag + [>]
   ENDIF

   RETURN cXml

FUNCTION DateXml( dDate )

   RETURN Transform( Dtos( dDate ), "@R 9999-99-99" )

FUNCTION NumberXml( nValue, nDecimals )

   hb_Default( @nDecimals, 0 )

   RETURN Ltrim( Str( nValue, 16, nDecimals ) )

FUNCTION DateTimeXml( dDate, cTime, cUF, lUTC, cUserTimeZone )

   LOCAL cText, lHorarioVerao

   hb_Default( @dDate, Date() )
   hb_Default( @cTime, Time() )
   hb_Default( @cUF, "SP" )
   hb_Default( @lUTC, .T. )

   lHorarioVerao := ( dDate >= HorarioVeraoInicio( Year( dDate ) ) .OR. dDate <= HorarioVeraoTermino( Year( dDate ) - 1 ) )
   cText := Transform( Dtos( dDate ), "@R 9999-99-99" ) + "T" + cTime
   DO CASE
   CASE ! Empty( cUserTimeZone )                               ; cText += cUserTimeZone
   CASE ! lUTC ; cText += "" // no UTC
   CASE cUF $ "AC"                                             ; cText += "-05:00"
   CASE cUF $ "MT,MS" .AND. lHorarioVerao                      ; cText += "-03:00"
   CASE cUF $ "DF,ES,GO,MG,PR,RJ,RS,SC" .AND. lHorarioVerao    ; cText += "-02:00"
   // SP n�o tem mais hor�rio de ver�o
   CASE cUF $ "AM,MT,MS,RO,RR"                                 ; cText += "-04:00"
   OTHERWISE                                                   ; cText += "-03:00" // demais casos
   ENDCASE

   RETURN cText

FUNCTION DomingoDePascoa( nAno )

   LOCAL nA, nB, nC, nD, nE, nF, nG, nH, nI, nK, nL, nM, nMes, nDia

   nA   := nAno % 19
   nB   := Int( nAno / 100 )
   nC   := nAno % 100
   nD   := Int( nB / 4 )
   nE   := nB % 4
   nF   := Int( ( nB + 8 ) / 25 )
   nG   := Int( ( nB - nF + 1 ) / 3 )
   nH   := ( 19 * nA + nB - nD - nG + 15 ) % 30
   nI   := Int( nC / 4 )
   nK   := nC % 4
   nL   := ( 32 + 2 * nE + 2 * nI - nH - nK ) % 7
   nM   := Int( ( nA + 11 * nH + 22 * nL ) / 451 )
   nMes := Int( ( nH + nL - 7 * nM + 114 ) / 31 )
   nDia := ( ( nH + nL - 7 * nM + 114 ) % 31 ) + 1

   RETURN Stod( StrZero( nAno, 4 ) + StrZero( nMes, 2 ) + StrZero( nDia, 2 ) )

FUNCTION TercaDeCarnaval( nAno )

   RETURN DomingoDePascoa( nAno ) - 47

FUNCTION HorarioVeraoInicio( nAno )

   LOCAL dPrimeiroDeOutubro, dPrimeiroDomingoDeOutubro, dTerceiroDomingoDeOutubro

   IF nAno == 2018
      dTerceiroDomingodeOutubro := Stod( "20181104" )
   ELSE
      dPrimeiroDeOutubro := Stod( StrZero( nAno, 4 ) + "1001" )
      dPrimeiroDomingoDeOutubro := dPrimeiroDeOutubro + iif( Dow( dPrimeiroDeOutubro ) == DOW_DOMINGO, 0, ( 7 - Dow( dPrimeiroDeOutubro ) + 1 ) )
      dTerceiroDomingoDeOutubro := dPrimeiroDomingoDeOutubro + 14
   ENDIF

   RETURN dTerceiroDomingoDeOutubro

FUNCTION HorarioVeraoTermino( nAno )

   LOCAL dPrimeiroDeFevereiro, dPrimeiroDomingoDeFevereiro, dTerceiroDomingoDeFevereiro

   dPrimeiroDeFevereiro := Stod( StrZero( nAno + 1, 4 ) + "0201" )
   dPrimeiroDomingoDeFevereiro := dPrimeiroDeFevereiro + iif( Dow( dPrimeiroDeFevereiro ) == DOW_DOMINGO, 0, ( 7 - Dow( dPrimeiroDeFevereiro ) + 1 ) )
   dTerceiroDomingoDeFevereiro := dPrimeiroDomingoDeFevereiro + 14
   IF dTerceiroDomingoDeFevereiro == TercaDeCarnaval( nAno + 1 ) - 2 /* nao pode ser domingo de carnaval */
      dTerceiroDomingoDeFevereiro += 7
   ENDIF

   RETURN dTerceiroDomingoDeFevereiro

FUNCTION XmlToString( cTexto )

   cTexto := Strtran( cTexto, "&amp;", "&" )
   cTexto := StrTran( cTexto, "&quot;", ["] )
   cTexto := StrTran( cTexto, "&#39;", "'" )
   cTexto := StrTran( cTexto, "&lt;", "<" )
   cTexto := StrTran( cTexto, "&gt;", ">" )
   cTexto := StrTran( cTexto, "&#176;", "�" )
   cTexto := StrTran( cTexto, "&#170;", "�" )

   RETURN cTexto

FUNCTION StringXML( cTexto )

   cTexto := AllTrim( cTexto )
   DO WHILE Space(2) $ cTexto
      cTexto := StrTran( cTexto, Space(2), Space(1) )
   ENDDO
   cTexto := StrTran( cTexto, "&", "E" ) // "&amp;" )
   cTexto := StrTran( cTexto, ["], "&quot;" )
   cTexto := StrTran( cTexto, "'", "&#39;" )
   cTexto := StrTran( cTexto, "<", "&lt;" )
   cTexto := StrTran( cTexto, ">", "&gt;" )
   cTexto := StrTran( cTexto, "�", "&#176;" )
   cTexto := StrTran( cTexto, "�", "&#170;" )

   RETURN cTexto

FUNCTION XmlToHash( cXml, aTagList, oVar )

   LOCAL oElement

   oVar := iif( oVar == NIL, hb_Hash(), oVar )

   FOR EACH oElement IN aTagList
      oVar[ oElement ] := XmlNode( cXml, oElement )
   NEXT

   RETURN oVar

FUNCTION MultipleNodeToArray( cXml, cNode, lComTag )

   LOCAL aNodes := {}

   DO WHILE "<" + cNode + " " $ cXml .OR. "<" + cNode + ">" $ cXml
      AAdd( aNodes , XmlNode( cXml, cNode, lComTag ) )
      IF ! "</" + cNode $ cXml
         cXml := ""
      ELSE
         cXml := Substr( cXml, At( "</" + cNode + ">", cXml ) + Len( "</" + cNode + ">" ) )
      ENDIF
   ENDDO

   RETURN aNodes

FUNCTION TrimXml( cTexto )

   cTexto := AllTrim( cTexto )
   DO WHILE Space(2) $ cTexto
      cTexto := StrTran( cTexto, Space(2), Space(1) )
   ENDDO

   RETURN cTexto
