import minio

client = minio.Minio(
  "grafhy.fnxln.com:3900",
  "GKb3dc0701c58845978fd54e2f",
  "6e21bd8e08e5ee70c0240b4fff93872fb855f1a24b4fa1d5a0ed58cccc572563",
  # Force the region, this is specific to garage
  region="garage",
  secure= False,
)

print(client.list_buckets())
sla = client.get_object('grafhy', 'imagem.webp').read()


with open('imagem.webp', 'wb') as file:
    file.write(sla)

# print(sla)

