echo "Generate Swift module files"
sourcekitten doc --spm --module-name Bluetooth > Bluetooth.json
sourcekitten doc --spm --module-name BluetoothGAP > BluetoothGAP.json
sourcekitten doc --spm --module-name BluetoothGATT > BluetoothGATT.json
sourcekitten doc --spm --module-name BluetoothHCI > BluetoothHCI.json
echo "Generate Jazzy documentation"
jazzy --sourcekitten-sourcefile Bluetooth.json,BluetoothGAP.json,BluetoothGATT.json,BluetoothHCI.json
