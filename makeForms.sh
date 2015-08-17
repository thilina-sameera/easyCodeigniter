sep="'"
sep2='"'
dollar="$"
mkdir Controller
cd Controller
touch $1
echo "<?php " >> $1
echo "class "$1" extends CI_controller{ " >> $1
echo "function __construct(){ " >>$1
echo "		parent::__construct(); " >>$1
echo "} " >> $1

echo " "

echo "public function index(){" >>$1
echo "if("$dollar"this->input->post("$sep$1$sep")){" >>$1

for arg; do
	if [ $arg != $1  ]; then
	echo ""$dollar$arg" = """$dollar"this->input->post("$sep$arg$sep");" >>$1
	fi
done
	echo ""$dollar"data = array(" >>$1
for arg; do
	if [ $arg != $1 ]; then
	echo ""$sep$arg$sep"=>"$dollar$arg",">> $1
	fi
done
echo "); " >> $1
echo ""$dollar"this->load->database(); " >> $1
echo ""$dollar"this->db->insert("$sep$1$sep","$dollar"data); ">>$1
echo "}" >>$1
echo "else{">>$1
echo ""$dollar"this->load->view("$sep$1$sep");" >>$1
echo "		}" >>$1
echo "	}" >>$1
echo "}">>$1

extension=".php"
cp $1 $1$extension

cd ..
mkdir View
cd View

touch $1
echo '<form method="POST">' >>$1

for arg; do

	if [ $arg != $1 ];
	then
	echo $arg"<br/>">>$1
	echo "What Form Element Suitable For "$arg
	echo "1 - Text Field "
	echo "2 - TextArea "
	echo "3 - Option Box"

	read option

	case $option in
		1)
		echo $arg" : ">>$1
		echo '<input type="text" name='$sep2$arg$sep2'><br/>' >> $1
		;;
		2)
		echo $arg" : <br/>">>$1
		echo '<textarea name='$sep2$arg$sep2' rows="10" cols="20"></textarea><br/>' >>$1
		;;
		3)
		echo $arg" : <br/>">>$1
		echo '<select name='$sep2$arg$sep2'>'>>$1
		echo '<option>Sample 1</option>'>>$1
		echo '<option>Sample 2</option>'>>$1
		echo '</select>'>>$1
		;;

		*)
		echo "Error in selection"
		;;

		esac
	fi
done

echo '<input type="submit"  value="Submit" name='$sep2$1$sep2'/>' >> $1
echo "</form>" >>$1


cp $i $i$extension
