### Notes for future self

__Local__

```bash
git submodule init

git submodule update

hugo # to only generate files

hugo serve # to generate and serve
```

__New posts__

To generate a new post from archetypes:

```bash
hugo new posts/post-title.md
```

__Deploy__

Now probably requires secrets/SSH setup on new boxes.

```bash
./deploy.sh
```
