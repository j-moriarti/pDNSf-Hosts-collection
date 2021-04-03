cp output/backup/sources-backup-*.zip output/main/sources-backup.zip
cd output/main/
for file in *
do
  curl -s --retry 3 --retry-delay 5 -X POST https://content.dropboxapi.com/2/files/upload \
    --header "Authorization: Bearer $SUPER_SECRET" \
    --header "Content-Type: application/octet-stream" \
    --header "Dropbox-API-Arg: {\"path\":\"/mirror/output/main/$file\",\"mode\":{\".tag\":\"overwrite\"}}" \
    --data-binary @$file > /dev/null
  sleep 3
done
rm -f sources-backup.zip
