import re

rex = re.compile(r'.*?{% hint.*?}(.*?){% endhint %}',re.S|re.M)
 
with open('concatenated.md') as f:

    data = f.read()

result = re.sub(r"{% hint.*?}","**Note:**\n",data)

result2 = re.sub(r"{% endhint %}","",result)

 
with open('concatenated_processed.md', "wt") as out_file:

    out_file.write(result2)

          
f.close()

out_file.close()