2022-0411-02)������ �˻���(SELECT ��)
    - SQL���� �� ���� ���� ���Ǵ� ����
    - �ڷ� �˻��� ���� ����
    (�������) --SELECT FROM WHERE�� ���� SELECT(�ʼ���)ȭ�鿡 ����� �÷� FROM(�ʼ���) WHERE��� �� ������� ����
             --������� FROM->WHERE->SELECT
     SELECT *|[DISTINCT]�÷��� [AS ��Ī][,] --*ALL Ȥ�� �÷��� / DISTINCT�ߺ������ϰ��ϳ���������. ��ǥ�ϳ������̱�
            �÷��� [AS ��Ī][,] --�������� ����� ���� ����Ѵ�(�������α׷��� ���� ������)
                :
            �÷��� [AS ��Ī] --��Ī�� Ư�� �߰��Ǹ� �ݵ�� �ֵ���ǥ
      FROM ���̺��� --���̺��� �丸 �� �� �ִ�
    [WHERE ����] --���� ����
    [GROUP BY �÷���[,�÷���,...]]
   [HAVING ����]
    [ORDER BY �÷��ε���|�÷��� [ASC|DESC][,�÷��ε���|�÷��� [ASC|DESC],...]]]; --ASC�������� DESC�������� �����ϸ� ���������⺻ ù��°�ɷ� ���ĵ����� �ι�°���ʹ� ����

(��뿹) ȸ�����̺����� ȸ����ȣ,ȸ����,�ּҸ� ��ȸ�Ͻÿ�. --��üȸ����ȸ->WHERE�� X  �ּҿ��� �⺻�ּһ��ּ� �����ϱ� �ʿ��÷�4��
    SELECT MEM_ID AS ȸ����ȣ,
          MEM_NAME AS ȸ����,
          MEM_ADD1||' '||MEM_ADD2 AS ��   �� -- ||=�ڹ��� + (���Ῥ����)/ ��   �� <-�� �ڿ� SELECT���� �����ٰ� ����-> FROM�� �ȿͼ������߻� �ذ���: "��   ��"
      FROM MEMBER;
    
(��뿹) ȸ�����̺����� '����'�� �����ϴ� ȸ����ȣ,ȸ����,�ּҸ� ��ȸ�Ͻÿ�.  
    SELECT MEM_ID AS ȸ����ȣ,
          MEM_NAME AS ȸ����,
          MEM_ADD1||' '||MEM_ADD2 AS "��   ��" 
      FROM MEMBER
  WHERE MEM_ADD1 LIKE '����%'; --���ϵ�ī�� ��Ī���ڿ�. '����' �ڿ��� ���� ���ڰ� �͵� ������ٴ� �� TRUE
  
(��뿹) ȸ�����̺����� '����'�� �����ϴ� ����ȸ���� ȸ����ȣ,ȸ����,�ּҸ� ��ȸ�Ͻÿ�.
    SELECT MEM_ID AS ȸ����ȣ,
          MEM_NAME AS ȸ����,
          MEM_ADD1||' '||MEM_ADD2 AS "��   ��" 
      FROM MEMBER
  WHERE MEM_ADD1 LIKE '����%'                   --AND �����̰�, �����̸� �ΰ��� ������ ��� �����ؾ���
    AND SUBSTR(MEM_REGNO2,1,1) IN('2','4');    --OR �����̰ų� �����̸�. 
    --SUBSTR�κй��ڿ� ���� (����,������ġ��,���ڼ�) IN('����','����'); 2�̰ų� �Ǵ� 4 -> TRUE
    
(��뿹) ȸ�����̺����� ȸ������ ��������(�����õ�)�� ��ȸ�Ͻÿ�. --DISTINCT �ߺ����� �߿�
    SELECT DISTINCT SUBSTR(MEM_ADD1,1,2) AS ������
        FROM MEMBER;