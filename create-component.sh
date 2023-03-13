#!/usr/bin/env sh

if [ $# -lt 2 ]; then
  echo "Invalid count of arguments"
  read -p ""
  exit 0
fi

baseDir=$1
componentName="${@: -1}"

if [ ! -d $baseDir ]; then
  echo "Direction $baseDir doesn't exists"
  read -p ""
  exit 0
fi

cd $baseDir

if [ -d $componentName ]; then
  echo "Component $componentName is already exists"
  read -p ""
  exit 0
fi

echo "export { default as $componentName } from './$componentName';" >> index.ts

mkdir $componentName
cd $componentName

echo "import { FC } from 'react';" > index.tsx
echo "import { Wrapper } from './styles';" >> index.tsx
echo "import { Props } from './types';" >> index.tsx
echo "" >> index.tsx
echo const "$componentName"": FC<Props> = (props) => (" >> index.tsx
echo "    <Wrapper>uw</Wrapper>" >> index.tsx
echo ");" >> index.tsx
echo "" >> index.tsx
echo "export default $componentName;" >> index.tsx

echo "import { ReactNode } from 'react'" > types.ts
echo "" >> types.ts
echo "export type Props = {">> types.ts
echo "  children: ReactNode;" >> types.ts
echo "};" >> types.ts

echo "import styled from 'styled-components';" > styles.ts
echo "" >> styles.ts
echo 'export const Wrapper = styled.div`' >> styles.ts
echo "    " >> styles.ts
echo '`;' >> types.ts >> styles.ts


read -p "Success"