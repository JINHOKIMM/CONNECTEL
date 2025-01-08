## 🏨 호텔 그룹웨어 + ERP 시스템 [CONNECTEL]
![readme첫사진](https://github.com/user-attachments/assets/ccf07eb5-ff86-4b24-aefa-e48570f6d538)

<br><br>

## 📖 프로젝트 개요
작년 호텔 시장의 성장과 호텔의 증가에 따라, 호텔 운영의 효율성을 극대화할 수 있는 그룹웨어 + ERP 시스템의 필요성이 커졌습니다. 이를 통해 호텔의 실시간 객실 모니터링, 예약관리, 객실관리 등을 통합하여 경쟁력을 강화하고자 개발하였습니다.

<br><br>

## 🖥️ 개발 환경
- **Back-end**: Java
- **Front-end**: HTML/CSS, Bootstrap, JavaScript, jQuery
- **View**: JSP
- **Framework**: Spring Boot, MyBatis
- **DB**: MariaDB
- **WAS**: Tomcat (웹서버가 따로 없어서 Tomcat을 웹서버로 사용함)
- **Infra**: Amazon Web Services
- **버전 관리**: GitHub, SourceTree

<br><br>

## 🗓️ 개발 과정
- **1주차** : 제안서 작성
- **2주차** : 요구사항정의서 및 UI 설계서 작성
- **3주차** : ERD 테이블 설계 및 인터페이스 설계
- **4주차** : 개발
- **5주차** : 개발
- **6주차** : 개발
- **7주차** : 테스트 및 테스트 내역서 작성


<br><br>

## 💡 전체 구현 기능
* 📝 전자결재
* 🧑‍💼 인사관리
* 📊 실시간 객실 모니터링
* 🏨 예약/투숙 관리
* 🛏️ 객실관리
* 📅 캘린더
* 💳 결제
* 📧 메일
* 💬 메신저
* 🌐 고객사이트
* ...

  
<br><br>


## 🛠️ 담당한 구현 페이지 및 기능
**[현장결제]**
* 해당 화면은 예약화면으로 체크인 날짜와 체크아웃 날짜를 선택하면 투숙할 박수가 계산됩니다.
* 선택한 투숙날짜의 총 가격과 예약가능 객실 수를 객실타입별로 출력합니다.
* 예약자의 정보를 입력후 결제 요청 버튼을 클릭하면 카카오페이 API를 사용하여 결제요청을 보냅니다.
  
| ![현장결제 카페전](https://github.com/user-attachments/assets/46d50bcc-4763-4d1c-91e3-0304c2301582) |
|:--:|
|현장결제|

<br><br>

**[카카오페이 결제]**
* QR결제 또는 카톡결제를 선택한 후 결제를 진행합니다.
* 결제 성공시 예약이 성공했다는 alert창이 뜹니다.
* 해당 결제/예약건은 예약리스트에서 확인이 가능하게 됩니다.

| ![카카오페이 결제](https://github.com/user-attachments/assets/8fe17004-c10b-4f4b-a5e0-93ecf344084c) | ![카카오톡 결제톡](https://github.com/user-attachments/assets/3ced0693-9827-47fb-b5b1-b7cb3a3ef1da) |
|:--:|:--:|
| 카카오페이 결제 | 카카오톡 결제문자 |


<br><br>

**[예약취소/환불]**
* 예약건을 환불할 경우 설정한 취소정책을 통해 환불퍼센트 설정이 가능합니다.
* 해당 취소/환불은 체크인 날짜를 기준으로 하루마다 결제금의 10% 환불을 진행합니다. (체크인날짜 기준 10일 전 취소시 100% 환불)
* 또한 전액환불 버튼을 통해 해당 예약건을 100% 환불처리 할 수 있습니다.
* 예약건에 대해 취소/환불 진행시 결제자의 카카오톡으로 환불금액과 취소문자가 전송됩니다.


| ![예약 취소](https://github.com/user-attachments/assets/f85d010b-dc40-4a15-b6d0-f9d036a2874d) | ![카카오톡 취소톡](https://github.com/user-attachments/assets/3a52c124-364b-4fbf-a32d-a7f8b308654b) |
|:--:|:--:|
| 예약 취소/환불 | 카카오톡 취소문자 |

<br><br>

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

<br><br>

**[객실변경]**
* 체크인한 객실에 문제가 생겼을 시 변경이 가능합니다.
* 같은 타입의 객실은 바로 변경이 가능하며, 객실 업그레이드 시에는 결제취소 후 재결제 또는 무료 업그레이드가 요구됩니다.
* 변경가능 객실은 현재 체크인, 체크아웃, 이용불가 객실을 제외한 체크인 가능한 객실만 출력됩니다.
  
| ![객실 변경](https://github.com/user-attachments/assets/8d00389a-ec07-4b2b-8ab8-70c250890f6d) |
|:--:|
| 객실변경 |

<br><br>

**[체크아웃]**
* 고객이 체크아웃할 때 투숙하던 객실 클릭 후 체크아웃 버튼을 클릭합니다.
* 해당 객실은 체크아웃 료된 객실을 개별적으로 또는 일괄적으로 상태변경이 가능합니다.

| ![체크인 가능으로 변경](https://github.com/user-attachments/assets/a0355cbf-914f-4f1c-824c-71a0f01b180d) |
|:--:|
| 체크아웃 -> 체크인 가능 |

<br><br>

**[객실상태변경]**
* 객실리스트 화면으로, 모든 객실의 타입과 현재 상태를 확인가능합니다.
* 객실에 문제가 생겼을 시 해당 객실을 이용불가 상태로 만들 수 있으며, 체크인이 불가능하게 막는 기능을 합니다.
* 문제 처리 후 이용이 가능할 시에 다시 버튼을 눌러 상태를 변경해줍니다.


| ![객실상태변경1](https://github.com/user-attachments/assets/52083574-bb09-4f33-b022-f2190f7a08f6) |
|:--:|
| 이용불가로 변경 |

| ![객실상태변경2](https://github.com/user-attachments/assets/c0d268e0-e598-4fca-95a0-3802b2aee3fb) |
|:--:|
| 이용가능으로 변경 |

<br><br>

**[특이사항 등록]**
* 객실을 청소/점검 중에 특이사항이 발생했을 경우 사진 첨부와 내용 등록이 가능합니다.
* 오른쪽 상단에 이용불가를 체크할 시 해당 객실은 곧 바로 이용불가 상태 처리가 되어 체크인이 불가합니다.
* 사진은 여러장 첨부할 수 있으며, 미첨부 시 내용만 출력합니다.

|![객실 특이사항](https://github.com/user-attachments/assets/d0690527-0ed0-4172-b0a2-d1dc95ea9cc3)|
|:--:|
| 특이사항 등록 |

<br><br>

**[특이사항 처리]**
* 특이사항을 처리한 경우 처리완료 버튼을 통해 객실을 이용가능 상태로 변경할 수 있습니다.
* 처리완료 버튼은 직급이 과장 이상인 직원에게만 보이며, 사원이나 대리의 직급은 처리할 수 없습니다.(권한)
* 등록건에 대한 수정도 가능하며 수정은 작성자만 가능합니다.

|![특이사항 처리완료](https://github.com/user-attachments/assets/e414bbab-4fbe-4c5c-b7c6-29fb76a8c79e)|
|:--:|
| 특이사항 처리 |

<br><br>


**[객실 기본가격 설정]**
* 월별로 객실의 기본가격을 설정하는 페이지입니다.
* 요일마다 객실 요금을 개별 입력할 수 있게하여, 월 ~ 목 / 금 ~ 토/ 일 ; 3개의 섹션으로 설정이 가능합니다.
* 설정한 객실 개별 가격은 캘린더에서 한 눈에 확인이 가능합니다.
* 아직 금액을 설정하지 않은 월은 예약페이지에서 날짜 선택이 불가능합니다.
 
|![기본가격설정](https://github.com/user-attachments/assets/4da9c2e4-c976-4820-a47a-fa2269db7c5d)|
|:--:|
| 기본가격설정 |

<br><br>

**[객실 가격 개별 변경]**
* 캘린더에서 설정한 날짜들의 객실 가격을 한 눈에 확인이 가능합니다.
* 지난 날짜의 가격은 변경할 수 없게 막혀있으며, 현재 날짜부터 변경이 가능합니다.
* 날짜 별로 가격을 변경할 수 있으며, 설정되어 있는 모든 가격들로 예약페이지에서 결제가 진행됩니다.

|![캘린더객실가격변경](https://github.com/user-attachments/assets/11c0918b-f2a7-41c9-a16c-15837e89d3f9)|
|:--:|
| 객실타입 가격 변경 |

<br><br>

**[주소록 관리]**
* 거래처 또는 고객에게 회사메일을 통해 보낼 때 사용되는 주소록입니다.
* 내 주소록에는 로그인한 계정으로 추가한 연락처만 출력됩니다.
* 별표 버튼을 통해 즐겨찾는 주소록에 이동이 가능합니다.
* 새 연락처를 등록할 수 있으며, 개별 삭제/ 일괄 삭제 모두 가능합니다.

|![주소록](https://github.com/user-attachments/assets/394ea0c8-b279-4c49-9bff-02911369ef8f)|
|:--:|
| 주소록 관리 |

<br><br>

**[메일전송]**
* 해당 화면은 메일 전송에 있는 주소록 버튼 클릭시 열리는 팝업창입니다.
* 내 주소록/ 고객주소록 / 즐겨찾기 탭으로 구분되며, 고객주소록은 우리 호텔 예약 시 입력한 이메일을 출력합니다.
* 연락처를 클릭하여 받는 사람에 In/out이 가능하며, 여러 명에게 동시 전송도 가능합니다.https://github.com/JINHOKIMM/CONNECTEL/blob/master/README.md
* 받는 사람에 추가한 후 확인 버튼 클릭시, 메일 전송 페이지에서 받는사람에 자동 입력됩니다.

|![메일주소록](https://github.com/user-attachments/assets/19bb3e6e-1a08-4f87-b4e6-b84c136c7f18)|
|:--:|
| 메일 주소록 |

<br>

* 받는사람, 제목, 내용, 파일첨부 순이며 받는사람과 제목은 필수 입력사항입니다.
* 2개 이상의 파일첨부도 가능하며 50MB의 제한이 있습니다.

|![메일전송](https://github.com/user-attachments/assets/471bda8c-541e-44d3-9708-6d3563d22883)|
|:--:|
| 메일 전송 |


|![전송된 메일](https://github.com/user-attachments/assets/e6957641-a687-4b70-995d-6bbd92ba498c)|
|:--:|
| 전송된 메일 |

<br><br>


## 📚 프로젝트 후기

 팀에서 팀원 한명의 부득이한 이탈로 다른 팀보다 적은 인원으로 프로젝트를 진행했습니다. 다른 팀과의 완성도나 속도면에서 차이가 날 수 있다고 생각하여, 설계기간에 스스로 기술검토를 진행한 경험이 많은 도움이 되었습니다.
외부 API를 사용한 것이 처음이라 해당 서버로 요청을 보내는 것에서 여러 어려움을 겪었지만, 그 때 마다 개발문서를 검토하며 성공했을 때의 성취감은 오랫동안 잊혀지지 않을 것 같습니다.

<p></p>

프로젝트를 진행하면서 볼륨을 키우는 것 보단, 하나하나 기능들의 디테일적인 부분에 중점을 두었고 사용자 측면에서의 편리성을 생각하며 개발했기에 **최우수상**을 받을 수 있었다고 생각합니다.
7주동안의 긴 여정에서 개발 초기 기간에 쳤던 코드보다 마지막 때 쳤던 코드에서 성장했음을 느끼며 앞으로도 지속적으로 성장하는 개발자가 되겠습니다.

<br>
