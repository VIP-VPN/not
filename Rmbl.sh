#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY�U!z  ����}����������~PD@ P���( ���4���I�  ��i�j����82h��CChi�F�d� ��h4�i�C��M�b C���!�� d40F��4hA� ��&A3Q�254�52��OM52h�mE���G3�"#��Ea$��08�s��	�uW��e��XL|�8��C�"�9B���lex�^i�Gh٣P��/���`��#Ѫ"oU|)׵NG�n��o^GFM���e4��,�/��=�h��k� �jO�ca��$L`~���9��������l��R	�S"@�Q<A�lH8�*ـ�`w���1$-�g��èƶ������-�m�I�Xy���6��a�q?�$�ͯL�BSc�' '�� WW�a�U�]"�Z�0��4
-��]LM�rlW#.�i�7H�y�f��OZN_rA��0)\���.��� iK�I>���.�ڶUN�4��,�*�9�����bY�^j�f"�0\����z�"W�HК(���!�,@���l)�	H hs��%!z��i^�ӝ8f-ŃIq���E֓��SA>Sc���R�X� �H����R��l���Z�?����n;�V�fmgz7�h�爸�l�Ј���-�h t����1Ҿ�U�(��M�B��d��+���y���ύ�ȋ����miq��ZH5�< s"%�6��f7��T�:(8S�R�5���g+��_Z5Z�0��D([����C���-�r��)�|� i�ݥT=i�y���k!�3����8x����W�+W�� �{��n�"��
}B"'��H�EF��?p��MǫM�f&�Gy:���9��D8A��}@���d�v�~��?q��"6�Ø��iOD��Jv�d���L�Z�����+���*h
 R����[gA��e:�U��9]�7�j�+9Ö�a���EjGm/O@7;Z�8����֚���@��$$0u�u�zW^Q����ܑN$(H^�