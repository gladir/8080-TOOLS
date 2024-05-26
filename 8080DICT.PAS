{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/8080-tools)
  @abstract(Target: Turbo Pascal, Free Pascal)
}

Program _8080DICT;

Uses Strings;

Type
 Instr8080Rec=Record
  Name:String[4];
  Description:PChar;
  Syntax:PChar;
 End;

Const
 Instr8080:Array[0..79]of Instr8080Rec=(
  (Name:'ACI';
   Description:'Cette instruction permet d''additionner une valeur '+
               'imm‚diate au registre A avec la retenue.';
   Syntax:'ACI valeur'),
  (Name:'ADC';
   Description:'Cette instruction permet d''additionner une op‚rande '+
               'et la valeur de l''indicateur de retenue au registre A '+
               '(Accumulateur).';
   Syntax:'ADC registresource'#13#10+
          'ADC memoiresource'),
  (Name:'ADD';
   Description:'Cette instruction permet d''additionner une op‚rande '+
               'au registre A (Accumulateur).';
   Syntax:'ADD registresource'#13#10+
          'ADD memoiresource'),
  (Name:'ADI';
   Description:'Cette instruction permet d''additionner une valeur '+
               'imm‚diate au registre A.';
   Syntax:'ADI valeur'),
  (Name:'ANA';
   Description:'Cette instruction permet … une op‚rande d''effectuer '+
               '®Et binaire¯ avec le registre A (Accumulateur).';
   Syntax:'ANA registresource'#13#10+
          'ANA memoiresource'),
  (Name:'ANI';
   Description:'Cette instruction permet … une valeur imm‚diate '+
               'd''effectuer ®Et binaire¯ avec le registre A (Accumulateur).';
   Syntax:'ANI valeur'),
  (Name:'CALL';
   Description:'Cette instruction permet d''appeler un sous-programme.';
   Syntax:'CALL adresse'),
  (Name:'CC';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'l''indicateur de retenue vaut 1.';
   Syntax:'CC adresse'),
  (Name:'CM';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'valeur inf‚rieur.';
   Syntax:'CM adresse'),
  (Name:'CMA';
   Description:'Cette instruction permet d''effectuer le compl‚ment du '+
               'registre A (accumulateur).';
   Syntax:'CMA'),
  (Name:'CMC';
   Description:'Cette instruction permet d''inverser la valeur de '+
               'l''indicateur de retenue.';
   Syntax:'CMC'),
  (Name:'CMP';
   Description:'Cette instruction permet d''effectuer la comparaison '+
               'd''une op‚rande avec le registre A (accumulateur).';
   Syntax:'CMP registresource'#13#10+
          'CMP memoiresource'),
  (Name:'CNC';
   Description:'Cette instruction permet d''appeler un sous-programme '+
               'si l''indicateur de retenue vaut 0.';
   Syntax:'CNC adresse'),
  (Name:'CNZ';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'l''indicateur de z‚ro vaut 0.';
   Syntax:'CNZ adresse'),
  (Name:'CP';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'l''indicateur de positif vaut 1.';
   Syntax:'CP adresse'),
  (Name:'CPE';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'parit‚.';
   Syntax:'CPE adresse'),
  (Name:'CPI';
   Description:'Cette instruction permet d''effectuer la comparaison '+
               'd''une valeur imm‚diate avec le registre A (accumulateur).';
   Syntax:'CPI valeur'),
  (Name:'CPO';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'parit‚ impaire.';
   Syntax:'CPO adresse'),
  (Name:'CZ';
   Description:'Cette instruction permet d''appeler un sous-programme si '+
               'l''indicateur de z‚ro vaut 1.';
   Syntax:'CZ adresse'),
  (Name:'DAA';
   Description:'Cette instruction corrige aprŠs coup les retenues lors de '+
               'la manipulation de valeur DCB.';
   Syntax:'DAA'),
  (Name:'DAD';
   Description:'Cette instruction permet d''additionner une paire de '+
               'registre au registre H et L.';
   Syntax:'DAD pairederegistre'),
  (Name:'DCR';
   Description:'Cette instruction permet de d‚cr‚menter une op‚rande de 1.';
   Syntax:'DCR registresource'#13#10+
          'DCR memoiresource'),
  (Name:'DCX';
   Description:'Cette instruction permet de d‚cr‚menter une paire de registre '+
               'de 1.';
   Syntax:'DCX pairederegistre'),
  (Name:'DI';
   Description:'Cette instruction permet de d‚sactiver l''indicateur '+
               'd''interruption.';
   Syntax:'DI'),
  (Name:'EI';
   Description:'Cette instruction permet d''activer l''indicateur '+
               'd''interruption.';
   Syntax:'EI'),
  (Name:'HLT';
   Description:'Cette instruction permet de faire passer le microprocesseur '+
               'en mode d''arrˆt.';
   Syntax:'HLT'),
  (Name:'IN';
   Description:'Cette instruction permet de recevoir dans le registre A '+
               '(accumulateur) la valeur du port d''entr‚e/sortie.';
   Syntax:'IN valeur'),
  (Name:'INR';
   Description:'Cette instruction permet d''incr‚menter une op‚rande de 1.';
   Syntax:'INR registresource'#13#10+
          'INR memoiresource'),
  (Name:'INX';
   Description:'Cette instruction permet d''incr‚menter une paire de registre '+
               'de 1.';
   Syntax:'INX pairederegistre'),
  (Name:'JC';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si l''indicateur de retenue vaut 1.';
   Syntax:'JC adresse'),
  (Name:'JM';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si la valeur de la comparaison '+
               'est inf‚rieur.';
   Syntax:'JM adresse'),
  (Name:'JMP';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚.';
   Syntax:'JMP adresse'),
  (Name:'JNC';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si l''indicateur de retenue '+
               'vaut 0.';
   Syntax:'JNC adresse'),
  (Name:'JNZ';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si l''indicateur de z‚ro vaut 0.';
   Syntax:'JNC adresse'),
  (Name:'JP';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si la valeur est positive.';
   Syntax:'JP adresse'),
  (Name:'JPE';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si parit‚.';
   Syntax:'JPE adresse'),
  (Name:'JPO';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si parit‚ impaire.';
   Syntax:'JPO adresse'),
  (Name:'JZ';
   Description:'Cette instruction permet d''effectuer un branchement … un '+
               'emplacement m‚moire sp‚cifi‚ si l''indicateur de z‚ro vaut 1.';
   Syntax:'JZ adresse'),
  (Name:'LDA';
   Description:'Cette instruction permet de copier une adresse 16 bits de '+
               'm‚moire dans le registre A.';
   Syntax:'LDA memoire'),
  (Name:'LDAX';
   Description:'Cette instruction permet de copier le contenu d''une adresse '+
               '16 bits de m‚moire dans une op‚rande.';
   Syntax:'LDAX pairederegistre'),
  (Name:'LHLD';
   Description:'Cette instruction permet de copier une valeur imm‚diate dans '+
               'la paire de registre H et L.';
   Syntax:'LHLD memoire'),
  (Name:'LXI';
   Description:'Cette instruction permet de copier une valeur imm‚diate de '+
               '16 bits dans une paire de registre sp‚cifi‚.';
   Syntax:'LXI pairederegistre'),
  (Name:'MOV';
   Description:'Cette instruction permet de copier op‚rande source dans une '+
               'op‚rande destinataire.';
   Syntax:'MOV registredestinataire,registresource'#13#10+
          'MOV memoiredestinataire,registresource'#13#10+
          'MOV registredestinataire,memoiresource'),
  (Name:'MVI';
   Description:'Cette instruction permet de copier une valeur imm‚diate dans '+
               'une op‚rande destinataire.';
   Syntax:'MVI registredestinataire,valeur'#13#10+
          'MVI memoiredestinataire,valeur'),
  (Name:'NOP';
   Description:'Cette instruction ne fait rien.';
   Syntax:'NOP'),
  (Name:'ORA';
   Description:'Cette instruction permet … une op‚rande d''effectuer ®Ou '+
               'binaire¯ avec le registre A (Accumulateur).';
   Syntax:'ORA registresource'#13#10+
          'ORA memoiresource'),
  (Name:'ORI';
   Description:'Cette instruction permet … une valeur imm‚diate d''effectuer '+
               '®Ou binaire¯ avec le registre A (Accumulateur).';
   Syntax:'ORI valeur'),
  (Name:'OUT';
   Description:'Cette instruction permet d''envoyer la valeur du registre '+
               'A (accumulateur) sur le port d''entr‚e/sortie.';
   Syntax:'OUT valeur'),
  (Name:'PCHL';
   Description:'Cette instruction permet de copier la paire de registre H et '+
               'L dans le registre de compteur programme.';
   Syntax:'PCHL'),
  (Name:'POP';
   Description:'Cette instruction permet de d‚piler une paire de registre de '+
               'la pile.';
   Syntax:'POP pairederegistre'),
  (Name:'PUSH';
   Description:'Cette instruction permet d''empiler une paire de registre '+
               'sur la pile.';
   Syntax:'PUSH pairederegistre'),
  (Name:'RAL';
   Description:'Cette instruction permet d''effectuer la rotation des bits '+
               'du registre A (accumulateur) et le bit de l''indicateur de '+
               'retenue vers la gauche.';
   Syntax:'RAL'),
  (Name:'RAR';
   Description:'Cette instruction permet d''effectuer la rotation des bits '+
               'du registre A (accumulateur) et le bit de l''indicateur de '+
               'retenue vers la droite.';
   Syntax:'RAR'),
  (Name:'RC';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si l''indicateur de retenue vaut 1.';
   Syntax:'RC'),
  (Name:'RET';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme.';
   Syntax:'RET'),
  (Name:'RIM';
   Description:'Cette instruction permet d''effectuer la lecture du masque '+
               'des interruptions.';
   Syntax:'RIM'),
  (Name:'RLC';
   Description:'Cette instruction permet d''effectuer la rotation des bits '+
               'du registre A (accumulateur) vers la gauche.';
   Syntax:'RLC'),
  (Name:'RM';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si la valeur est inf‚rieur.';
   Syntax:'RM'),
  (Name:'RNC';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si l''indicateur de retenue vaut 0.';
   Syntax:'RNC'),
  (Name:'RNZ';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si l''indicateur de z‚ro vaut 0.';
   Syntax:'RNZ'),
  (Name:'RP';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si la valeur est positive.';
   Syntax:'RP'),
  (Name:'RPE';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si parit‚.';
   Syntax:'RPE'),
  (Name:'RPO';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si parit‚ impaire.';
   Syntax:'RPO'),
  (Name:'RRC';
   Description:'Cette instruction permet d''effectuer la rotation des '+
               'bits du registre A (accumulateur) vers la droite.';
   Syntax:'RRC'),
  (Name:'RST';
   Description:'Cette instruction permet d''effectuer l''appel d''un '+
               'sous-programme d''interruption.';
   Syntax:'RST valeur'),
  (Name:'RZ';
   Description:'Cette instruction permet d''effectuer le retour d''un '+
               'sous-programme si l''indicateur de z‚ro vaut 1.';
   Syntax:'RZ'),
  (Name:'SBB';
   Description:'Cette instruction permet de soustraire l''op‚rande source '+
               'au registre A (accumulateur) et d''ensuite enlever la valeur '+
               'de l''indicateur de retenue … la somme obtenu.';
   Syntax:'SBB registresource'#13#10+
          'SBB memoiresource'),
  (Name:'SBI';
   Description:'Cette instruction permet de soustraire une valeur imm‚diate '+
               'et la valeur de l''indicateur de retenu au registre A '+
               '(accumulateur).';
   Syntax:'SBI valeur'),
  (Name:'SHLD';
   Description:'Cette instruction permet de copier le registre H et L dans '+
               'une adresse de 16-bits de m‚moire absolue.';
   Syntax:'SHLD memoire'),
  (Name:'SIM';
   Description:'Cette instruction permet de fixer le masque des interruptions.';
   Syntax:'SIM'),
  (Name:'SPHL';
   Description:'Cette instruction permet de copier la paire de registre H et '+
               'L dans le registre SP.';
   Syntax:'SPHL'),
  (Name:'STA';
   Description:'Cette instruction permet de copier le registre A (Accumulateur) '+
               'dans une adresse de 16-bits de m‚moire absolue.';
   Syntax:'STA memoire'),
  (Name:'STAX';
   Description:'Cette instruction permet de copier le registre A (Accumulateur) '+
               'dans une adresse de 16-bits de m‚moire sp‚cifi‚ par une paire de '+
               'registre.';
   Syntax:'STAX pairederegistre'),
  (Name:'STC';
   Description:'Cette instruction permet de fixer l''indicateur de retenue … 1.';
   Syntax:'STC'),
  (Name:'SUB';
   Description:'Cette instruction permet de soustraire l''op‚rande source au '+
               'registre A (accumulateur).';
   Syntax:'SUB registresource'#13#10+
          'SUB memoiresource'),
  (Name:'SUI';
   Description:'Cette instruction permet de soustraire une valeur imm‚diate au '+
               'registre A (accumulateur).';
   Syntax:'SUI valeur'),
  (Name:'XCHG';
   Description:'Cette instruction permet d''‚changer la valeurs des registres '+
               'H et L ainsi que D et E.';
   Syntax:'XCHG'),
  (Name:'XRA';
   Description:'Cette instruction permet … une op‚rande d''effectuer ®Ou exclusif '+
               'binaire¯ avec le registre A (Accumulateur).';
   Syntax:'XRA registresource'#13#10+
          'XRA memoiresource'),
  (Name:'XRI';
   Description:'Cette instruction permet … une valeur imm‚diate d''effectuer ®Ou '+
               'exclusif binaire¯ avec le registre A (Accumulateur).';
   Syntax:'XRI valeur'),
  (Name:'XTHL';
   Description:'Cette instruction permet d''‚changer la valeur des paires de '+
               'registres H et L avec le haut de la pile.';
   Syntax:'XTHL')
 );

Var
 I,J:Integer;

Function PadRight(S:String;Space:Byte):String;
Var
 I:Byte;
Begin
 If Length(S)<Space Then For I:=Length(S)+1 to Space do S:=S+' ';
 PadRight:=S;
End;

Function StrToUpper(S:String):String;
Var
 I:Byte;
Begin
 For I:=1 to Length(S)do Begin
  If S[I] in['a'..'z']Then S[I]:=Chr(Ord(S[I])-32);
 End;
 StrToUpper:=S;
End;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('8080DICT : Cette commande permet d''afficher la liste des ',
           'instructions ou une instruction de l''assembleur 8080.');
  WriteLn;
  WriteLn('Syntaxe : 8080DICT [/LIST] [instruction]');
  WriteLn;
  WriteLN(' instruction   Affiche l''instruction sp‚cifi‚');
  WriteLn(' /LIST         Affiche la liste des instructions');
 End
  Else
 If ParamCount>0 Then Begin
  For I:=1 to ParamCount do Begin
   If StrToUpper(ParamStr(I))='/LIST'Then Begin
    For J:=Low(Instr8080)to High(Instr8080)do Begin
     WriteLn(PadRight(Instr8080[J].Name,10),StrPas(Instr8080[J].Description));
    End;
   End
    Else
   Begin
    For J:=Low(Instr8080)to High(Instr8080)do Begin
     If StrToUpper(ParamStr(I))=StrToUpper(Instr8080[J].Name)Then Begin
      WriteLn('Instruction : ');
      WriteLn;
      WriteLn(Instr8080[J].Name);
      WriteLn;
      WriteLn('Syntaxe : ');
      WriteLn;
      WriteLn(StrPas(Instr8080[J].Syntax));
      WriteLn;
      WriteLn('Description :');
      WriteLn;
      WriteLn(StrPas(Instr8080[J].Description));
     End;
    End;
   End;
  End;
 End
  Else
 WriteLn('ParamŠtre requis !');
END.

