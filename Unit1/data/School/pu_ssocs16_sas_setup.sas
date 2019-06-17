
***********************************************************************************
****FILENAME:		ssocs16_pu_sas_setup.sas
****AUTHOR:			United States Department of Education
					National Center for Education Statistics
****INPUT FILE:		pu_ssocs16.dat
****OUPTUT FILE:	pu_ssocs_read.sas7dbat

****PURPOSE:
	This file reads in the 2016 School Survey on Crime and Safety (SSOCS:2016)
	Fixed Format ASCII file and outputs a SAS dataset.

****A NOTE OF CAUTION:
	The code that follows assumes that the SSOCS:2016 file has been copied
	onto your hard drive into the C:\SSOCS16 directory. If this is not the
	case, you must change C:\SSOCS16 in the %LET statement below to the path in
	which the pu_ssocs16_format.sas, pu_ssocs16_fmt.sas, and pu_ssocs16.dat
	files are located.

****LAST UPDATED: 12/06/2017
***********************************************************************************;
%LET path = C:\SSOCS16; *see NOTE above;
%LET name = pu_ssocs16.dat;

LIBNAME out "&path";

%INCLUDE "&&path\pu_ssocs16_format.sas";


data out.pu_ssocs_read;
infile "&&path\&name" lrecl=1358 missover;
input
@1    SCHID    4.0
@5    C0014_R    2.0
@7    C0016_R    2.0
@9    C0110    1.0
@10    C0112    1.0
@11    C0114    1.0
@12    C0116    1.0
@13    C0120    1.0
@14    C0121    1.0
@15    C0122    1.0
@16    C0124    1.0
@17    C0126    1.0
@18    C0128    1.0
@19    C0130    1.0
@20    C0134    1.0
@21    C0136    1.0
@22    C0138    1.0
@23    C0139    1.0
@24    C0140    1.0
@25    C0141    1.0
@26    C0142    1.0
@27    C0143    1.0
@28    C0144    1.0
@29    C0146    1.0
@30    C0148    1.0
@31    C0150    1.0
@32    C0151    1.0
@33    C0153    1.0
@34    C0155    1.0
@35    C0157    1.0
@36    C0158    1.0
@37    C0162    1.0
@38    C0166    1.0
@39    C0169    1.0
@40    C0170    1.0
@41    C0173    1.0
@42    C0163    1.0
@43    C0165    1.0
@44    C0167    1.0
@45    C0174    1.0
@46    C0175    1.0
@47    C0176    1.0
@48    C0177    1.0
@49    C0178    1.0
@50    C0179    1.0
@51    C0180    1.0
@52    C0181    1.0
@53    C0182    1.0
@54    C0183    1.0
@55    C0186    1.0
@56    C0600    1.0
@57    C0602    2.0
@59    C0604    1.0
@60    C0606    1.0
@61    C0608    1.0
@62    C0190    1.0
@63    C0192    1.0
@64    C0194    1.0
@65    C0196    1.0
@66    C0198    1.0
@67    C0200    1.0
@68    C0202    1.0
@69    C0204    1.0
@70    C0206    1.0
@71    C0208    1.0
@72    C0210    1.0
@73    C0212    1.0
@74    C0214    1.0
@75    C0216    1.0
@76    C0218    1.0
@77    C0610    1.0
@78    C0612    2.0
@80    C0614    2.0
@82    C0616    2.0
@84    C0618    2.0
@86    C0620    2.0
@88    C0622    2.0
@90    C0624    2.0
@92    C0626    2.0
@94    C0628    2.0
@96    C0630    2.0
@98    C0632    2.0
@100    C0634    2.0
@102    C0636    2.0
@104    C0638    2.0
@106    C0640    2.0
@108    C0642    2.0
@110    C0644    2.0
@112    C0646    2.0
@114    C0648    2.0
@116    C0650    2.0
@118    C0652    2.0
@120    C0654    2.0
@122    C0656    2.0
@124    C0658    2.0
@126    C0660    2.0
@128    C0662    1.0
@129    C0664    1.0
@130    C0666    1.0
@131    C0668    1.0
@132    C0670    1.0
@133    C0672    1.0
@134    C0674    1.0
@135    C0676    1.0
@136    C0678    1.0
@137    C0680    1.0
@138    C0682    1.0
@139    C0684    1.0
@140    C0686    1.0
@141    C0265    1.0
@142    C0266    1.0
@143    C0267    1.0
@144    C0268    1.0
@145    C0269    1.0
@146    C0270    1.0
@147    C0271    1.0
@148    C0272    1.0
@149    C0273    1.0
@150    C0274    1.0
@151    C0276    1.0
@152    C0277    1.0
@153    C0280    1.0
@154    C0282    1.0
@155    C0284    1.0
@156    C0286    1.0
@157    C0288    1.0
@158    C0290    1.0
@159    C0292    1.0
@160    C0294    1.0
@161    C0296    1.0
@162    C0298    1.0
@163    C0300    1.0
@164    C0302    1.0
@165    C0304    1.0
@166    C0306    1.0
@167    C0308    1.0
@168    C0688_R    1.0
@169    C0690_R    1.0
@170    C0374    1.0
@171    C0376    1.0
@172    C0378    1.0
@173    C0380    1.0
@174    C0381    1.0
@175    C0382    1.0
@176    C0383    1.0
@177    C0384    1.0
@178    C0386    1.0
@179    C0389    1.0
@180    C0391    1.0
@181    C0393    1.0
@182    C0390    1.0
@183    C0392    2.0
@185    C0394    1.0
@186    C0396    2.0
@188    C0398    1.0
@189    C0400    2.0
@191    C0402    1.0
@192    C0404    2.0
@194    C0406    1.0
@195    C0408    2.0
@197    C0410    1.0
@198    C0412    2.0
@200    C0414    1.0
@201    C0416    2.0
@203    C0418    1.0
@204    C0420    2.0
@206    C0422    1.0
@207    C0424    2.0
@209    C0426    1.0
@210    C0428    2.0
@212    C0430    1.0
@213    C0432    2.0
@215    C0434    1.0
@216    C0436    2.0
@218    C0438    1.0
@219    C0440    2.0
@221    C0442    1.0
@222    C0444    2.0
@224    C0446    1.0
@225    C0448    2.0
@227    C0450    1.0
@228    C0452    2.0
@230    C0454    1.0
@231    C0456    2.0
@233    C0518    2.0
@235    C0520    3.0
@238    C0526    3.0
@241    C0528    2.0
@243    C0532    3.0
@246    C0534    3.0
@249    C0536    3.0
@252    C0538    2.0
@254    C0560    1.0
@255    C0562    1.0
@256    C0568    3.0
@259    C0570    4.0
@263    C0572    3.0
@266    C0578    $8.
@274    C0578_DD    2.0
@276    C0578_MM    2.0
@278    C0578_YY    4.0
@282    C0580    3.0
@285    CRISIS16    1.0
@286    DISTOT16    4.0
@290    INCID16    3.0
@293    INCPOL16    3.0
@296    OTHACT16    3.0
@299    OUTSUS16    3.0
@302    PROBWK16    1.0
@303    REMOVL16    2.0
@305    STRATA    3.0
@308    STUOFF16    3.0
@311    SVINC16    2.0
@313    SVPOL16    2.0
@315    TRANSF16    3.0
@318    VIOINC16    3.0
@321    VIOPOL16    3.0
@324    DISFIRE16    2.0
@326    DISDRUG16    3.0
@329    DISWEAP16    2.0
@331    DISRUPT    2.0
@333    DISATT16    4.0
@337    DISALC16    2.0
@339    SEC_FT16    2.0
@341    SEC_PT16    2.0
@343    FR_URBAN    1.0
@344    FR_LVEL    $1.
@345    FR_SIZE    1.0
@346    PERCWHT    $1.
@347    FINALWGT    16.8
@363    REPFWT1    16.8
@379    REPFWT2    16.8
@395    REPFWT3    16.8
@411    REPFWT4    16.8
@427    REPFWT5    16.8
@443    REPFWT6    16.8
@459    REPFWT7    16.8
@475    REPFWT8    16.8
@491    REPFWT9    16.8
@507    REPFWT10    16.8
@523    REPFWT11    16.8
@539    REPFWT12    16.8
@555    REPFWT13    16.8
@571    REPFWT14    16.8
@587    REPFWT15    16.8
@603    REPFWT16    16.8
@619    REPFWT17    16.8
@635    REPFWT18    16.8
@651    REPFWT19    16.8
@667    REPFWT20    16.8
@683    REPFWT21    16.8
@699    REPFWT22    16.8
@715    REPFWT23    16.8
@731    REPFWT24    16.8
@747    REPFWT25    16.8
@763    REPFWT26    16.8
@779    REPFWT27    16.8
@795    REPFWT28    16.8
@811    REPFWT29    16.8
@827    REPFWT30    16.8
@843    REPFWT31    16.8
@859    REPFWT32    16.8
@875    REPFWT33    16.8
@891    REPFWT34    16.8
@907    REPFWT35    16.8
@923    REPFWT36    16.8
@939    REPFWT37    16.8
@955    REPFWT38    16.8
@971    REPFWT39    16.8
@987    REPFWT40    16.8
@1003    REPFWT41    16.8
@1019    REPFWT42    16.8
@1035    REPFWT43    16.8
@1051    REPFWT44    16.8
@1067    REPFWT45    16.8
@1083    REPFWT46    16.8
@1099    REPFWT47    16.8
@1115    REPFWT48    16.8
@1131    REPFWT49    16.8
@1147    REPFWT50    16.8
@1163    IC0110    1.0
@1164    IC0112    1.0
@1165    IC0114    1.0
@1166    IC0116    1.0
@1167    IC0120    1.0
@1168    IC0121    1.0
@1169    IC0122    1.0
@1170    IC0124    1.0
@1171    IC0126    1.0
@1172    IC0128    1.0
@1173    IC0130    1.0
@1174    IC0134    1.0
@1175    IC0136    1.0
@1176    IC0138    1.0
@1177    IC0139    1.0
@1178    IC0140    1.0
@1179    IC0141    1.0
@1180    IC0142    1.0
@1181    IC0143    1.0
@1182    IC0144    1.0
@1183    IC0146    1.0
@1184    IC0148    1.0
@1185    IC0150    1.0
@1186    IC0151    1.0
@1187    IC0153    1.0
@1188    IC0155    1.0
@1189    IC0157    1.0
@1190    IC0158    1.0
@1191    IC0162    1.0
@1192    IC0166    1.0
@1193    IC0169    1.0
@1194    IC0170    1.0
@1195    IC0173    1.0
@1196    IC0163    1.0
@1197    IC0165    1.0
@1198    IC0167    1.0
@1199    IC0174    1.0
@1200    IC0175    1.0
@1201    IC0176    1.0
@1202    IC0177    1.0
@1203    IC0178    1.0
@1204    IC0179    1.0
@1205    IC0180    1.0
@1206    IC0181    1.0
@1207    IC0182    1.0
@1208    IC0183    1.0
@1209    IC0186    1.0
@1210    IC0600    1.0
@1211    IC0602    1.0
@1212    IC0604    1.0
@1213    IC0606    1.0
@1214    IC0608    1.0
@1215    IC0190    1.0
@1216    IC0192    1.0
@1217    IC0194    1.0
@1218    IC0196    1.0
@1219    IC0198    1.0
@1220    IC0200    1.0
@1221    IC0202    1.0
@1222    IC0204    1.0
@1223    IC0206    1.0
@1224    IC0208    1.0
@1225    IC0210    1.0
@1226    IC0212    1.0
@1227    IC0214    1.0
@1228    IC0216    1.0
@1229    IC0218    1.0
@1230    IC0610    1.0
@1231    IC0612    1.0
@1232    IC0614    1.0
@1233    IC0616    1.0
@1234    IC0618    1.0
@1235    IC0620    1.0
@1236    IC0622    1.0
@1237    IC0624    1.0
@1238    IC0626    1.0
@1239    IC0628    1.0
@1240    IC0630    1.0
@1241    IC0632    1.0
@1242    IC0634    1.0
@1243    IC0636    1.0
@1244    IC0638    1.0
@1245    IC0640    1.0
@1246    IC0642    1.0
@1247    IC0644    1.0
@1248    IC0646    1.0
@1249    IC0648    1.0
@1250    IC0650    1.0
@1251    IC0652    1.0
@1252    IC0654    1.0
@1253    IC0656    1.0
@1254    IC0658    1.0
@1255    IC0660    1.0
@1256    IC0662    1.0
@1257    IC0664    1.0
@1258    IC0666    1.0
@1259    IC0668    1.0
@1260    IC0670    1.0
@1261    IC0672    1.0
@1262    IC0674    1.0
@1263    IC0676    1.0
@1264    IC0678    1.0
@1265    IC0680    1.0
@1266    IC0682    1.0
@1267    IC0684    1.0
@1268    IC0686    1.0
@1269    IC0265    1.0
@1270    IC0266    1.0
@1271    IC0267    1.0
@1272    IC0268    1.0
@1273    IC0269    1.0
@1274    IC0270    1.0
@1275    IC0271    1.0
@1276    IC0272    1.0
@1277    IC0273    1.0
@1278    IC0274    1.0
@1279    IC0276    1.0
@1280    IC0277    1.0
@1281    IC0280    1.0
@1282    IC0282    1.0
@1283    IC0284    1.0
@1284    IC0286    1.0
@1285    IC0288    1.0
@1286    IC0290    1.0
@1287    IC0292    1.0
@1288    IC0294    1.0
@1289    IC0296    1.0
@1290    IC0298    1.0
@1291    IC0300    1.0
@1292    IC0302    1.0
@1293    IC0304    1.0
@1294    IC0306    1.0
@1295    IC0308    1.0
@1296    IC0688    1.0
@1297    IC0690    1.0
@1298    IC0374    1.0
@1299    IC0376    1.0
@1300    IC0378    1.0
@1301    IC0380    1.0
@1302    IC0381    1.0
@1303    IC0382    1.0
@1304    IC0383    1.0
@1305    IC0384    1.0
@1306    IC0386    1.0
@1307    IC0389    1.0
@1308    IC0391    1.0
@1309    IC0393    1.0
@1310    IC0390    1.0
@1311    IC0392    1.0
@1312    IC0394    1.0
@1313    IC0396    1.0
@1314    IC0398    1.0
@1315    IC0400    1.0
@1316    IC0402    1.0
@1317    IC0404    1.0
@1318    IC0406    1.0
@1319    IC0408    1.0
@1320    IC0410    1.0
@1321    IC0412    1.0
@1322    IC0414    1.0
@1323    IC0416    1.0
@1324    IC0418    1.0
@1325    IC0420    1.0
@1326    IC0422    1.0
@1327    IC0424    1.0
@1328    IC0426    1.0
@1329    IC0428    1.0
@1330    IC0430    1.0
@1331    IC0432    1.0
@1332    IC0434    1.0
@1333    IC0436    1.0
@1334    IC0438    1.0
@1335    IC0440    1.0
@1336    IC0442    1.0
@1337    IC0444    1.0
@1338    IC0446    1.0
@1339    IC0448    1.0
@1340    IC0450    1.0
@1341    IC0452    1.0
@1342    IC0454    1.0
@1343    IC0456    1.0
@1344    IC0518    1.0
@1345    IC0520    1.0
@1346    IC0526    1.0
@1347    IC0528    1.0
@1348    IC0532    1.0
@1349    IC0534    1.0
@1350    IC0536    1.0
@1351    IC0538    1.0
@1352    IC0560    1.0
@1353    IC0562    1.0
@1354    IC0568    1.0
@1355    IC0570    1.0
@1356    IC0572    1.0
@1357    IC0578    1.0
@1358    IC0580    1.0
;
label
SCHID = "Unique school identifier"
C0014_R = "Title/position of respondent (recoded)"
C0016_R = "# of years respondent at the school (topcoded)"
C0110 = "School practice require visitor check in and badges"
C0112 = "Building access controlled locked/monitored doors"
C0114 = "Grounds access controlled locked/monitored gates"
C0116 = "Students pass through metal detectors"
C0120 = "Have random metal detector checks on students"
C0121 = "Equip classrooms with locks so that doors are locked from inside"
C0122 = "Practice to close campus for lunch"
C0124 = "Practice random dog sniffs for drugs"
C0126 = "Random sweeps for contraband not including dog sniffs"
C0128 = "Require drug testing for athletes"
C0130 = "Require drug testing for students in extra-curricular activities"
C0134 = "Require students to wear uniforms"
C0136 = "Practice to enforce a strict dress code"
C0138 = "Provide school lockers to students"
C0139 = "Silent alarms directly connected to law enforcement"
C0140 = "Require clear book bags or ban book bags"
C0141 = "Provide an electronic notification system that automatically notifies parents in case of a school-wide emergency"
C0142 = "Require students to wear badge or photo ID"
C0143 = "Provide a structured anonymous threat reporting system"
C0144 = "Require faculty/staff to wear badge or photo ID"
C0146 = "Security camera(s) monitor the school"
C0148 = "Provide telephones in most classrooms"
C0150 = "Provide two-way radios to any staff"
C0151 = "Limit access to social networking sites"
C0153 = "Prohibit use of cell phones and text messaging devices"
C0155 = "Written plan for active shooter scenario"
C0157 = "Written plan for post-crisis reunification of students with their families"
C0158 = "Written plan for natural disasters"
C0162 = "Written plan for hostages"
C0166 = "Written plan for bomb threats"
C0169 = "Written plan for suicide threat or incident"
C0170 = "Written plan for chemical, biological, or radiological threats"
C0173 = "Written plan for pandemic flu"
C0163 = "Drilled students on plan for evacuation"
C0165 = "Drilled students on plan for lockdown"
C0167 = "Drilled students on plan for shelter-in-place"
C0174 = "Prevention curriculum/instruction/training"
C0175 = "Student involvement in peer mediation"
C0176 = "Behavioral modification for students"
C0177 = "Student court to address student conduct problems or minor offenses"
C0178 = "Student counseling/social work"
C0179 = "Student involvement in restorative circles"
C0180 = "Individual mentoring/tutoring by students"
C0181 = "Individual mentoring/tutoring by adults"
C0182 = "Recreation/enrichment student activities"
C0183 = "Social emotional learning training for students"
C0186 = "Promote sense of community/integration"
C0600 = "Have a threat assessment team"
C0602 = "Threat assessment team formal meetings"
C0604 = "LGBTQ acceptance group"
C0606 = "Disability acceptance group"
C0608 = "Cultural diversity acceptance group"
C0190 = "Formal process to obtain parental input"
C0192 = "Provide training/assistance to parents"
C0194 = "Program involves parents at school"
C0196 = "Parent participates in open house or back to school night"
C0198 = "Parent participates in parent-teacher conference"
C0200 = "Parent participates in subject-area events"
C0202 = "Parent volunteers at school"
C0204 = "Community involvement - parent groups"
C0206 = "Community involvement - social services"
C0208 = "Community involvement - juvenile justice"
C0210 = "Community involvement - law enforcement"
C0212 = "Community involvement - mental health"
C0214 = "Community involvement - civic organizations"
C0216 = "Community involvement - business"
C0218 = "Community involvement - religious organizations"
C0610 = "Sworn law enforcement officers at school"
C0612 = "Sworn law enforcement officers present during school"
C0614 = "Sworn law enforcement officers while students arriving or leaving"
C0616 = "Sworn law enforcement officers present at school activities"
C0618 = "Sworn law enforcement officers present at other times"
C0620 = "Sworn law enforcement officers with stun gun"
C0622 = "Sworn law enforcement officers with chemical sprays"
C0624 = "Sworn law enforcement officers with firearms"
C0626 = "Sworn law enforcement officers wear a body camera"
C0628 = "Sworn law enforcement officers participate in traffic control"
C0630 = "Sworn law enforcement officers participate in patrol"
C0632 = "Sworn law enforcement officers participate in discipline"
C0634 = "Sworn law enforcement officers participate with emergency personnel"
C0636 = "Sworn law enforcement officers participate in solving school problems"
C0638 = "Sworn law enforcement officers participate in prevention training"
C0640 = "Sworn law enforcement officers participate in student mentoring"
C0642 = "Sworn law enforcement officers participate in teaching law-related courses"
C0644 = "Sworn law enforcement officers participate in recording or reporting discipline problems"
C0646 = "Sworn law enforcement officers participate in providing legal definitions"
C0648 = "Sworn law enforcement officer present for all instructional hours"
C0650 = "Formalized policies for sworn law enforcement officers"
C0652 = "Policies for sworn law enforcement officers include student discipline"
C0654 = "Policies for sworn law enforcement officers include use of restraints"
C0656 = "Policies for sworn law enforcement officers include use of firearms"
C0658 = "Policies for sworn law enforcement officers include making arrests"
C0660 = "Policies for sworn law enforcement officers include reporting of offenses"
C0662 = "Diagnostic assessment at school by school-employed mental health professional"
C0664 = "Diagnostic assessment at school by school-funded mental health professional"
C0666 = "Diagnostic assessment outside of school by school-funded mental health professional"
C0668 = "Treatment at school by school-employed mental health professional"
C0670 = "Treatment at school by school-funded mental health professional"
C0672 = "Treatment outside of school by school-funded mental health professional"
C0674 = "Inadequate access to professionals limits mental health efforts"
C0676 = "Inadequate funding limits mental health efforts"
C0678 = "Potential legal issues limit mental health efforts"
C0680 = "Lack of parental support limits mental health efforts"
C0682 = "Lack of community support limits mental health efforts"
C0684 = "Payment policies limit mental health efforts"
C0686 = "Reluctance to label students limits mental health efforts"
C0265 = "Teacher training - discipline policies related to cyberbullying"
C0266 = "Teacher training - classroom management"
C0267 = "Teacher training - discipline policies related to bullying"
C0268 = "Teacher training - discipline policies related to violence"
C0269 = "Teacher training - alcohol or drug discipline policy"
C0270 = "Teacher training - safety procedures"
C0271 = "Teacher training - intervention and referral strategies"
C0272 = "Teacher training - early warning signs for violent behavior"
C0273 = "Teacher training - recognize bullying behavior"
C0274 = "Teacher training - student alcohol/drug abuse"
C0276 = "Teacher training - positive behavioral intervention"
C0277 = "Teacher training - crisis prevention and intervention"
C0280 = "Efforts limited by inadequate/lack of teacher training"
C0282 = "Efforts limited by inadequate/lack of alternative placement"
C0284 = "Efforts limited by parental complaints"
C0286 = "Efforts limited by inadequate/lack of teacher support"
C0288 = "Efforts limited by inadequate/lack of parent support"
C0290 = "Efforts limited by fear of student retaliation"
C0292 = "Efforts limited by fear of litigation"
C0294 = "Efforts limited by inadequate funds"
C0296 = "Efforts limited by inconsistent application of policies"
C0298 = "Efforts limited by fear of district or state reprisal"
C0300 = "Efforts limited by fed policies/special ed"
C0302 = "Efforts limited by other federal policies-not special ed"
C0304 = "Efforts limited by other state/district policies-not special ed"
C0306 = "Any school deaths from homicides"
C0308 = "School shooting incidents"
C0688_R = "Number of arrests at school"
C0690_R = "Any hate crimes"
C0374 = "How often student racial/ethnic tensions"
C0376 = "How often student bullying occurs"
C0378 = "How often student sexual harassment of students"
C0380 = "How often student verbal abuse of teachers"
C0381 = "How often student harassment based on sexual orientation"
C0382 = "How often widespread disorder in classrooms"
C0383 = "How often student harassment based on gender identity"
C0384 = "How often student acts of disrespect for teachers-not verbal abuse"
C0386 = "How often student gang activities"
C0389 = "How often cyberbullying among students"
C0391 = "How often school environment affected by cyberbullying"
C0393 = "How often staff resources used to deal with cyberbullying"
C0390 = "Removal with no services available"
C0392 = "Removal with no services available - action used"
C0394 = "Removal with tutoring/at-home instruction available"
C0396 = "Removal with tutoring/at-home instruction available - action used"
C0398 = "Transfer to specialized school available"
C0400 = "Transfer to specialized school available - action used"
C0402 = "Transfer to regular school available"
C0404 = "Transfer to regular school available - action used"
C0406 = "Outside suspension/no services available"
C0408 = "Outside suspension/no services available - action used"
C0410 = "Outside suspension with services available"
C0412 = "Outside suspension with services available - action used"
C0414 = "In-school suspension/no services available"
C0416 = "In-school suspension/no services available - action used"
C0418 = "In-school suspension with services available"
C0420 = "In-school suspension with services available - action used"
C0422 = "Referral to school counselor available"
C0424 = "Referral to school counselor available - action used"
C0426 = "In-school disciplinary plan available"
C0428 = "In-school disciplinary plan available - action used"
C0430 = "Outside school disciplinary plan available"
C0432 = "Outside school disciplinary plan available - action used"
C0434 = "Loss of bus privileges for misbehavior available"
C0436 = "Loss of bus privileges for misbehavior available - action used"
C0438 = "Corporal punishment available"
C0440 = "Corporal punishment available - action used"
C0442 = "School probation available"
C0444 = "School probation available - action used"
C0446 = "Detention/Saturday school available"
C0448 = "Detention/Saturday school available - action used"
C0450 = "Loss of student privileges available"
C0452 = "Loss of student privileges available - action used"
C0454 = "Require community service available"
C0456 = "Require community service available - action used"
C0518 = "# of removals with no service - total"
C0520 = "# of transfers to specialized schools - total"
C0526 = "Percent students limited English proficient"
C0528 = "Percent special education students"
C0532 = "Percent students below 15th percentile standardized tests"
C0534 = "Percent students likely to go to college"
C0536 = "Percent students academic achievement important"
C0538 = "Typical number of classroom changes"
C0560 = "Crime where students live"
C0562 = "Crime where school located"
C0568 = "Average percent daily attendance"
C0570 = "# of students transferred to school"
C0572 = "# of students transferred from school"
C0578 = "Date questionnaire completed MMDDYYYY"
C0578_DD = "Day questionnaire completed"
C0578_MM = "Month questionnaire completed"
C0578_YY = "Year questionnaire completed"
C0580 = "Number of minutes to complete questionnaire"
CRISIS16 = "# of types of crises covered in written plans"
DISTOT16 = "Total number of disciplinary actions recorded"
INCID16 = "Total number of incidents recorded"
INCPOL16 = "Total number of incidents reported to police"
OTHACT16 = "Total 'other actions' for specified offenses"
OUTSUS16 = "Total out-of-school suspensions > 5 days but < the remainder of school for specified offenses"
PROBWK16 = "# of types of problems that occur at least once a week"
REMOVL16 = "Total removals with no continuing school services for specified offenses"
STRATA = "Collapsed STRATUM code"
STUOFF16 = "Total students involved in specified offenses"
SVINC16 = "Total number of serious violent incidents recorded"
SVPOL16 = "Total number of serious violent incidents reported to police"
TRANSF16 = "Total transfers to specialized schools for specified offenses"
VIOINC16 = "Total number of violent incidents recorded"
VIOPOL16 = "Total number of violent incidents reported to police"
DISFIRE16 = "Total # of disciplinary actions for firearm use/possession"
DISDRUG16 = "Total # of disciplinary actions for distribution/possession/use-illegal drugs"
DISWEAP16 = "Total # of disciplinary actions for weapon use"
DISRUPT = "Total number of disruptions"
DISATT16 = "Total # of disciplinary actions for attacks/fights" 
DISALC16 = "Total # of disciplinary actions for distribution/possession/use-alcohol"
SEC_FT16 = "Total # of full-time security guards, SROs, or sworn law enforcement officers"
SEC_PT16 = "Total # of part-time security guards, SROs, or sworn law enforcement officers" 
FR_URBAN = "Urbanicity - Based on Urban-centric location of school"
FR_LVEL = "Grade Level of school"
FR_SIZE = "Size of school"
PERCWHT = "Percent non-Hispanic White enrollment-categorical"
FINALWGT = "Final weight for the sample"
REPFWT1 = "Jackknife replicate 1"
REPFWT2 = "Jackknife replicate 2"
REPFWT3 = "Jackknife replicate 3"
REPFWT4 = "Jackknife replicate 4"
REPFWT5 = "Jackknife replicate 5"
REPFWT6 = "Jackknife replicate 6"
REPFWT7 = "Jackknife replicate 7"
REPFWT8 = "Jackknife replicate 8"
REPFWT9 = "Jackknife replicate 9"
REPFWT10 = "Jackknife replicate 10"
REPFWT11 = "Jackknife replicate 11"
REPFWT12 = "Jackknife replicate 12"
REPFWT13 = "Jackknife replicate 13"
REPFWT14 = "Jackknife replicate 14"
REPFWT15 = "Jackknife replicate 15"
REPFWT16 = "Jackknife replicate 16"
REPFWT17 = "Jackknife replicate 17"
REPFWT18 = "Jackknife replicate 18"
REPFWT19 = "Jackknife replicate 19"
REPFWT20 = "Jackknife replicate 20"
REPFWT21 = "Jackknife replicate 21"
REPFWT22 = "Jackknife replicate 22"
REPFWT23 = "Jackknife replicate 23"
REPFWT24 = "Jackknife replicate 24"
REPFWT25 = "Jackknife replicate 25"
REPFWT26 = "Jackknife replicate 26"
REPFWT27 = "Jackknife replicate 27"
REPFWT28 = "Jackknife replicate 28"
REPFWT29 = "Jackknife replicate 29"
REPFWT30 = "Jackknife replicate 30"
REPFWT31 = "Jackknife replicate 31"
REPFWT32 = "Jackknife replicate 32"
REPFWT33 = "Jackknife replicate 33"
REPFWT34 = "Jackknife replicate 34"
REPFWT35 = "Jackknife replicate 35"
REPFWT36 = "Jackknife replicate 36"
REPFWT37 = "Jackknife replicate 37"
REPFWT38 = "Jackknife replicate 38"
REPFWT39 = "Jackknife replicate 39"
REPFWT40 = "Jackknife replicate 40"
REPFWT41 = "Jackknife replicate 41"
REPFWT42 = "Jackknife replicate 42"
REPFWT43 = "Jackknife replicate 43"
REPFWT44 = "Jackknife replicate 44"
REPFWT45 = "Jackknife replicate 45"
REPFWT46 = "Jackknife replicate 46"
REPFWT47 = "Jackknife replicate 47"
REPFWT48 = "Jackknife replicate 48"
REPFWT49 = "Jackknife replicate 49"
REPFWT50 = "Jackknife replicate 50"
IC0110 = "Imputation Flag for C0110"
IC0112 = "Imputation Flag for C0112"
IC0114 = "Imputation Flag for C0114"
IC0116 = "Imputation Flag for C0116"
IC0120 = "Imputation Flag for C0120"
IC0121 = "Imputation Flag for C0121"
IC0122 = "Imputation Flag for C0122"
IC0124 = "Imputation Flag for C0124"
IC0126 = "Imputation Flag for C0126"
IC0128 = "Imputation Flag for C0128"
IC0130 = "Imputation Flag for C0130"
IC0134 = "Imputation Flag for C0134"
IC0136 = "Imputation Flag for C0136"
IC0138 = "Imputation Flag for C0138"
IC0139 = "Imputation Flag for C0139"
IC0140 = "Imputation Flag for C0140"
IC0141 = "Imputation Flag for C0141"
IC0142 = "Imputation Flag for C0142"
IC0143 = "Imputation Flag for C0143"
IC0144 = "Imputation Flag for C0144"
IC0146 = "Imputation Flag for C0146"
IC0148 = "Imputation Flag for C0148"
IC0150 = "Imputation Flag for C0150"
IC0151 = "Imputation Flag for C0151"
IC0153 = "Imputation Flag for C0153"
IC0155 = "Imputation Flag for C0155"
IC0157 = "Imputation Flag for C0157"
IC0158 = "Imputation Flag for C0158"
IC0162 = "Imputation Flag for C0162"
IC0166 = "Imputation Flag for C0166"
IC0169 = "Imputation Flag for C0169"
IC0170 = "Imputation Flag for C0170"
IC0173 = "Imputation Flag for C0173"
IC0163 = "Imputation Flag for C0163"
IC0165 = "Imputation Flag for C0165"
IC0167 = "Imputation Flag for C0167"
IC0174 = "Imputation Flag for C0174"
IC0175 = "Imputation Flag for C0175"
IC0176 = "Imputation Flag for C0176"
IC0177 = "Imputation Flag for C0177"
IC0178 = "Imputation Flag for C0178"
IC0179 = "Imputation Flag for C0179"
IC0180 = "Imputation Flag for C0180"
IC0181 = "Imputation Flag for C0181"
IC0182 = "Imputation Flag for C0182"
IC0183 = "Imputation Flag for C0183"
IC0186 = "Imputation Flag for C0186"
IC0600 = "Imputation Flag for C0600"
IC0602 = "Imputation Flag for C0602"
IC0604 = "Imputation Flag for C0604"
IC0606 = "Imputation Flag for C0606"
IC0608 = "Imputation Flag for C0608"
IC0190 = "Imputation Flag for C0190"
IC0192 = "Imputation Flag for C0192"
IC0194 = "Imputation Flag for C0194"
IC0196 = "Imputation Flag for C0196"
IC0198 = "Imputation Flag for C0198"
IC0200 = "Imputation Flag for C0200"
IC0202 = "Imputation Flag for C0202"
IC0204 = "Imputation Flag for C0204"
IC0206 = "Imputation Flag for C0206"
IC0208 = "Imputation Flag for C0208"
IC0210 = "Imputation Flag for C0210"
IC0212 = "Imputation Flag for C0212"
IC0214 = "Imputation Flag for C0214"
IC0216 = "Imputation Flag for C0216"
IC0218 = "Imputation Flag for C0218"
IC0610 = "Imputation Flag for C0610"
IC0612 = "Imputation Flag for C0612"
IC0614 = "Imputation Flag for C0614"
IC0616 = "Imputation Flag for C0616"
IC0618 = "Imputation Flag for C0618"
IC0620 = "Imputation Flag for C0620"
IC0622 = "Imputation Flag for C0622"
IC0624 = "Imputation Flag for C0624"
IC0626 = "Imputation Flag for C0626"
IC0628 = "Imputation Flag for C0628"
IC0630 = "Imputation Flag for C0630"
IC0632 = "Imputation Flag for C0632"
IC0634 = "Imputation Flag for C0634"
IC0636 = "Imputation Flag for C0636"
IC0638 = "Imputation Flag for C0638"
IC0640 = "Imputation Flag for C0640"
IC0642 = "Imputation Flag for C0642"
IC0644 = "Imputation Flag for C0644"
IC0646 = "Imputation Flag for C0646"
IC0648 = "Imputation Flag for C0648"
IC0650 = "Imputation Flag for C0650"
IC0652 = "Imputation Flag for C0652"
IC0654 = "Imputation Flag for C0654"
IC0656 = "Imputation Flag for C0656"
IC0658 = "Imputation Flag for C0658"
IC0660 = "Imputation Flag for C0660"
IC0662 = "Imputation Flag for C0662"
IC0664 = "Imputation Flag for C0664"
IC0666 = "Imputation Flag for C0666"
IC0668 = "Imputation Flag for C0668"
IC0670 = "Imputation Flag for C0670"
IC0672 = "Imputation Flag for C0672"
IC0674 = "Imputation Flag for C0674"
IC0676 = "Imputation Flag for C0676"
IC0678 = "Imputation Flag for C0678"
IC0680 = "Imputation Flag for C0680"
IC0682 = "Imputation Flag for C0682"
IC0684 = "Imputation Flag for C0684"
IC0686 = "Imputation Flag for C0686"
IC0265 = "Imputation Flag for C0265"
IC0266 = "Imputation Flag for C0266"
IC0267 = "Imputation Flag for C0267"
IC0268 = "Imputation Flag for C0268"
IC0269 = "Imputation Flag for C0269"
IC0270 = "Imputation Flag for C0270"
IC0271 = "Imputation Flag for C0271"
IC0272 = "Imputation Flag for C0272"
IC0273 = "Imputation Flag for C0273"
IC0274 = "Imputation Flag for C0274"
IC0276 = "Imputation Flag for C0276"
IC0277 = "Imputation Flag for C0277"
IC0280 = "Imputation Flag for C0280"
IC0282 = "Imputation Flag for C0282"
IC0284 = "Imputation Flag for C0284"
IC0286 = "Imputation Flag for C0286"
IC0288 = "Imputation Flag for C0288"
IC0290 = "Imputation Flag for C0290"
IC0292 = "Imputation Flag for C0292"
IC0294 = "Imputation Flag for C0294"
IC0296 = "Imputation Flag for C0296"
IC0298 = "Imputation Flag for C0298"
IC0300 = "Imputation Flag for C0300"
IC0302 = "Imputation Flag for C0302"
IC0304 = "Imputation Flag for C0304"
IC0306 = "Imputation Flag for C0306"
IC0308 = "Imputation Flag for C0308"
IC0688 = "Imputation Flag for C0688"
IC0690 = "Imputation Flag for C0690"
IC0374 = "Imputation Flag for C0374"
IC0376 = "Imputation Flag for C0376"
IC0378 = "Imputation Flag for C0378"
IC0380 = "Imputation Flag for C0380"
IC0381 = "Imputation Flag for C0381"
IC0382 = "Imputation Flag for C0382"
IC0383 = "Imputation Flag for C0383"
IC0384 = "Imputation Flag for C0384"
IC0386 = "Imputation Flag for C0386"
IC0389 = "Imputation Flag for C0389"
IC0391 = "Imputation Flag for C0391"
IC0393 = "Imputation Flag for C0393"
IC0390 = "Imputation Flag for C0390"
IC0392 = "Imputation Flag for C0392"
IC0394 = "Imputation Flag for C0394"
IC0396 = "Imputation Flag for C0396"
IC0398 = "Imputation Flag for C0398"
IC0400 = "Imputation Flag for C0400"
IC0402 = "Imputation Flag for C0402"
IC0404 = "Imputation Flag for C0404"
IC0406 = "Imputation Flag for C0406"
IC0408 = "Imputation Flag for C0408"
IC0410 = "Imputation Flag for C0410"
IC0412 = "Imputation Flag for C0412"
IC0414 = "Imputation Flag for C0414"
IC0416 = "Imputation Flag for C0416"
IC0418 = "Imputation Flag for C0418"
IC0420 = "Imputation Flag for C0420"
IC0422 = "Imputation Flag for C0422"
IC0424 = "Imputation Flag for C0424"
IC0426 = "Imputation Flag for C0426"
IC0428 = "Imputation Flag for C0428"
IC0430 = "Imputation Flag for C0430"
IC0432 = "Imputation Flag for C0432"
IC0434 = "Imputation Flag for C0434"
IC0436 = "Imputation Flag for C0436"
IC0438 = "Imputation Flag for C0438"
IC0440 = "Imputation Flag for C0440"
IC0442 = "Imputation Flag for C0442"
IC0444 = "Imputation Flag for C0444"
IC0446 = "Imputation Flag for C0446"
IC0448 = "Imputation Flag for C0448"
IC0450 = "Imputation Flag for C0450"
IC0452 = "Imputation Flag for C0452"
IC0454 = "Imputation Flag for C0454"
IC0456 = "Imputation Flag for C0456"
IC0518 = "Imputation Flag for C0518"
IC0520 = "Imputation Flag for C0520"
IC0526 = "Imputation Flag for C0526"
IC0528 = "Imputation Flag for C0528"
IC0532 = "Imputation Flag for C0532"
IC0534 = "Imputation Flag for C0534"
IC0536 = "Imputation Flag for C0536"
IC0538 = "Imputation Flag for C0538"
IC0560 = "Imputation Flag for C0560"
IC0562 = "Imputation Flag for C0562"
IC0568 = "Imputation Flag for C0568"
IC0570 = "Imputation Flag for C0570"
IC0572 = "Imputation Flag for C0572"
IC0578 = "Imputation Flag for C0578"
IC0580 = "Imputation Flag for C0580"
;
format
%INCLUDE "&&path\pu_ssocs16_fmt.sas";
run;
