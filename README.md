## 🏨 호텔 그룹웨어 + ERP 시스템 [CONNECTEL]
![readme첫사진](https://github.com/user-attachments/assets/ccf07eb5-ff86-4b24-aefa-e48570f6d538)
https://github.com/JINHOKIMM/CONNECTEL/settings

<br>

## 📖 프로젝트 개요
작년 호텔 시장의 성장과 호텔의 증가에 따라, 호텔 운영의 효율성을 극대화할 수 있는 그룹웨어 + ERP 시스템의 필요성이 커졌습니다. 이를 통해 호텔의 실시간 객실 모니터링, 예약관리, 객실관리 등을 통합하여 경쟁력을 강화하고자 개발하였습니다.

<br>

## 🖥️ 개발 환경
- **Back-end** : Java
- **Front** : HTML/CSS, BootStrap, JavaScript, jQuery
- **Framework** : Spring Boot Framework, Mybatis Framework
- **DB** : Maria DB
- **WAS** : Tomcat(웹서버가 따로 없어서 tomcat을 웹서버로 사용함)
- **Infra** : Amazon Web Services
- **버전관리** : GitHub,SourceTree

<br>

## 🛠️ 담당 구현 페이지
**[현장결제]**
* 예약화면으로 체크인 날짜와 체크아웃 날짜를 선택하면 투숙할 박수가 계산됩니다.
* 선택한 투숙날짜의 총 가격과 예약가능 객실 수를 객실타입별로 출력합니다.
* 예약자의 정보를 입력후 결제 요청 버튼을 클릭하면 카카오페이 API를 사용하여 결제요청을 보냅니다.
  
| ![현장결제 카페전](https://github.com/user-attachments/assets/46d50bcc-4763-4d1c-91e3-0304c2301582) |
|:--:|
|현장결제|

<br>

**[카카오페이 결제]**
* QR결제 또는 카톡결제를 선택한 후 결제를 진행합니다.
* 결제 성공시 예약이 성공했다는 alert창이 뜹니다.
* 해당 결제/예약건은 예약리스트에서 확인이 가능하게 됩니다.

| ![카카오페이 결제](https://github.com/user-attachments/assets/8fe17004-c10b-4f4b-a5e0-93ecf344084c) | ![카카오톡 결제톡](https://github.com/user-attachments/assets/3ced0693-9827-47fb-b5b1-b7cb3a3ef1da) |
|:--:|:--:|
| 카카오페이 결제 | 카카오톡 결제톡 |

<br>


**[체크인]**
* 실시간 객실 모니터링 페이지입니다.
* 체크인 가능 / 체크인 / 체크아웃 / 이용불가 ; 4개의 객실상태가 있습니다.
* 체크인이 가능한 객실(초록색박스)을 클릭 하면 오늘 체크인이 가능한 예약리스트가 출력됩니다.
* 체크인하려는 예약자를 더블클릭 후 체크인을 진행합니다.
* 체크인이 완료되면 해당 객실은 체크인 상태(하늘색박스)로 변경이 됩니다.
* 체크인한 예약자는 투숙리스트에 추가됩니다.  

| ![체크인](https://github.com/user-attachments/assets/e6c77b38-1cb9-4739-91df-bdc4c3b70e57) |
|:--:|
| 체크인 |

<br>

**[객실변경]**
* 체크인한 객실에 문제가 생겼을 시 변경이 가능합니다.
* 같은 타입의 객실은 바로 변경이 가능하며, 객실 업그레이드 시에는 결제취소 후 재결제 또는 무료 업그레이드가 요구됩니다.
* 변경가능 객실은 현재 체크인, 체크아웃, 이용불가 객실을 제외한 체크인 가능한 객실만 출력됩니다.
  
| ![객실 변경](https://github.com/user-attachments/assets/8d00389a-ec07-4b2b-8ab8-70c250890f6d) |
|:--:|
| 객실변경 |

<br>

**[체크아웃]**
* 고객이 체크아웃할 때 투숙하던 객실 클릭 후 체크아웃 버튼을 클릭합니다.
* 해당 객실은 체크아웃 객실(빨간색박스)이 되며, 객실 청소를 진행하게 됩니다.
* 해당 고객이 체크인/체크아웃 시간을 투숙한 객실정보와 함께 투숙리스트에서 확인할 수 있습니다.

|![체크아웃](https://github.com/user-attachments/assets/2a0d7a98-762b-4ccf-a8cb-2ee5677de611) |
|:--:|
| 체크아웃 |

<br>



