sleep 5
if curl dockerapp:5000 | grep -q 'load'; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi