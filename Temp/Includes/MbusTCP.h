/* Automation Studio generated header file */
/* Do not edit ! */
/* MbusTCP 2.00.0 */

#ifndef _MBUSTCP_
#define _MBUSTCP_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _MbusTCP_VERSION
#define _MbusTCP_VERSION 2.00.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "astime.h"
		#include "AsIecCon.h"
		#include "standard.h"
		#include "AsTCP.h"
		#include "AsBrStr.h"
		#include "AsARCfg.h"
		#include "sys_lib.h"
#endif
#ifdef _SG4
		#include "astime.h"
		#include "AsIecCon.h"
		#include "standard.h"
		#include "AsTCP.h"
		#include "AsBrStr.h"
		#include "AsARCfg.h"
		#include "sys_lib.h"
#endif
#ifdef _SGC
		#include "astime.h"
		#include "AsIecCon.h"
		#include "standard.h"
		#include "AsTCP.h"
		#include "AsBrStr.h"
		#include "AsARCfg.h"
		#include "sys_lib.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 #define LOG_LINE_NUM 50U
 #define LOG_LINE_LEN 100U
 #define SLAVE_MAX_CONNECTION_NUM 3U
 #define SLAVE_MAX_REGISTER_NUM 256U
 #define MASTER_MAX_ACTION_NUM 30U
 #define READ_COILS 1U
 #define READ_DISCRETE_INPUTS 2U
 #define READ_HOLDING_REGISTERS 3U
 #define READ_INPUT_REGISTERS 4U
 #define WRITE_SINGLE_COIL 5U
 #define WRITE_SINGLE_REGISTER 6U
 #define WRITE_MULTIPLE_COILS 15U
 #define WRITE_MULTIPLE_REGISTERS 16U
 #define ON 65280U
 #define OFF 0U
 #define ERROR_CRITICAL 50000U
 #define ERROR_MESSAGE_SIZE 50001U
 #define ERROR_MESSAGE_FORMAT 50002U
 #define ERROR_REC_BUF_EXCEEDED 50003U
 #define ERROR_ADR_EMPTY 50004U
 #define ERROR_QUANTITY 50006U
 #define ERROR_TOO_MANY_MASTERS 50100U
 #define ERROR_ADR_EXCEEDED 50101U
 #define ERROR_LENGTH_EXCEEDED 50102U
 #define ERROR_FUNCTION_CODE 50103U
 #define ERROR_MASTER_TIMED_OUT 50104U
 #define ERROR_CFG_MASTERS 50110U
 #define ERROR_BAD_SLAVE_DATA 50200U
 #define ERROR_SLAVE_DATA_TOO_SHORT 50201U
 #define ERROR_SLAVE_DATA_TOO_LONG 50202U
 #define ERROR_TIMEOUT_REQ 50210U
 #define ERROR_TIMEOUT_CONNECT 50211U
 #define ERROR_DEVICE_ERR 50300U
 #define ERROR_MOD_FUNCTION 1U
 #define ERROR_MOD_ADR 2U
 #define ERROR_MOD_VALUE 3U
 #define TYP_REQUEST 0U
 #define TYP_RESPONSE 1U
 #define SLAVE_MAX_CONNECTION_INDEX 2U
 #define SLAVE_MAX_REGISTER_INDEX 255U
 #define MASTER_MAX_ACTION_INDEX 29U
 #define MODBUS_TCP_PORT 502U
 #define MODBUS_MAX_REG 125U
 #define DISABLE 65534U
 #define BUSY 65535U
 #define RECEIVE_TIMEOUT 5000U
 #define DEBUG_LEVEL 2U
#else
 _GLOBAL_CONST unsigned char LOG_LINE_NUM;
 _GLOBAL_CONST unsigned char LOG_LINE_LEN;
 _GLOBAL_CONST unsigned char SLAVE_MAX_CONNECTION_NUM;
 _GLOBAL_CONST unsigned short SLAVE_MAX_REGISTER_NUM;
 _GLOBAL_CONST unsigned short MASTER_MAX_ACTION_NUM;
 _GLOBAL_CONST unsigned char READ_COILS;
 _GLOBAL_CONST unsigned char READ_DISCRETE_INPUTS;
 _GLOBAL_CONST unsigned char READ_HOLDING_REGISTERS;
 _GLOBAL_CONST unsigned char READ_INPUT_REGISTERS;
 _GLOBAL_CONST unsigned char WRITE_SINGLE_COIL;
 _GLOBAL_CONST unsigned char WRITE_SINGLE_REGISTER;
 _GLOBAL_CONST unsigned char WRITE_MULTIPLE_COILS;
 _GLOBAL_CONST unsigned char WRITE_MULTIPLE_REGISTERS;
 _GLOBAL_CONST unsigned short ON;
 _GLOBAL_CONST unsigned short OFF;
 _GLOBAL_CONST unsigned short ERROR_CRITICAL;
 _GLOBAL_CONST unsigned short ERROR_MESSAGE_SIZE;
 _GLOBAL_CONST unsigned short ERROR_MESSAGE_FORMAT;
 _GLOBAL_CONST unsigned short ERROR_REC_BUF_EXCEEDED;
 _GLOBAL_CONST unsigned short ERROR_ADR_EMPTY;
 _GLOBAL_CONST unsigned short ERROR_QUANTITY;
 _GLOBAL_CONST unsigned short ERROR_TOO_MANY_MASTERS;
 _GLOBAL_CONST unsigned short ERROR_ADR_EXCEEDED;
 _GLOBAL_CONST unsigned short ERROR_LENGTH_EXCEEDED;
 _GLOBAL_CONST unsigned short ERROR_FUNCTION_CODE;
 _GLOBAL_CONST unsigned short ERROR_MASTER_TIMED_OUT;
 _GLOBAL_CONST unsigned short ERROR_CFG_MASTERS;
 _GLOBAL_CONST unsigned short ERROR_BAD_SLAVE_DATA;
 _GLOBAL_CONST unsigned short ERROR_SLAVE_DATA_TOO_SHORT;
 _GLOBAL_CONST unsigned short ERROR_SLAVE_DATA_TOO_LONG;
 _GLOBAL_CONST unsigned short ERROR_TIMEOUT_REQ;
 _GLOBAL_CONST unsigned short ERROR_TIMEOUT_CONNECT;
 _GLOBAL_CONST unsigned short ERROR_DEVICE_ERR;
 _GLOBAL_CONST unsigned short ERROR_MOD_FUNCTION;
 _GLOBAL_CONST unsigned short ERROR_MOD_ADR;
 _GLOBAL_CONST unsigned short ERROR_MOD_VALUE;
 _GLOBAL_CONST unsigned char TYP_REQUEST;
 _GLOBAL_CONST unsigned char TYP_RESPONSE;
 _GLOBAL_CONST unsigned char SLAVE_MAX_CONNECTION_INDEX;
 _GLOBAL_CONST unsigned short SLAVE_MAX_REGISTER_INDEX;
 _GLOBAL_CONST unsigned char MASTER_MAX_ACTION_INDEX;
 _GLOBAL_CONST unsigned short MODBUS_TCP_PORT;
 _GLOBAL_CONST unsigned short MODBUS_MAX_REG;
 _GLOBAL_CONST unsigned short DISABLE;
 _GLOBAL_CONST unsigned short BUSY;
 _GLOBAL_CONST unsigned short RECEIVE_TIMEOUT;
 _GLOBAL_CONST unsigned char DEBUG_LEVEL;
#endif




/* Datatypes and datatypes of function blocks */
typedef enum step_enum
{	INIT,
	GET_IP,
	WAIT_SERVER,
	OPEN_PORT,
	SET_LINGER,
	SET_NODELAY,
	WAIT_CONNECTION,
	WAIT_REQUEST,
	SEND_ANSWER,
	CREATE_REQUEST,
	SEND_REQUEST,
	WAIT_ANSWER,
	CLOSE_PORT,
	WAIT,
	ERROR
} step_enum;

typedef enum step_sub_enum
{	SUB_WAIT,
	SUB_SEND,
	SUB_CLOSE_MASTER
} step_sub_enum;

typedef struct receive_buff_typ
{	unsigned char byte[501];
} receive_buff_typ;

typedef struct t_master_request
{	unsigned short transaction_id;
	unsigned short protocol_id;
	unsigned short length;
	unsigned char unit;
	unsigned char function_code;
	unsigned short quantity;
} t_master_request;

typedef struct t_read_request
{	unsigned short starting_addr;
	unsigned short quantity;
} t_read_request;

typedef struct t_single_write_request
{	unsigned short starting_addr;
	unsigned short value;
} t_single_write_request;

typedef struct t_multiple_write_request
{	unsigned short starting_addr;
	unsigned short quantity;
	unsigned short byte_nr;
} t_multiple_write_request;

typedef struct master_info_typ
{	unsigned long ident;
	unsigned short port;
	unsigned char ip_addr[18];
	struct TON timeout_timer;
	plcbit disconnect;
} master_info_typ;

typedef struct modbus_master_action_enable_typ
{	plcbit cyclic;
	plcbit single;
} modbus_master_action_enable_typ;

typedef struct modbus_master_action_param_typ
{	unsigned char unit;
	unsigned char type;
	unsigned short start_addr;
	unsigned short quantity;
	unsigned long p_pv;
	unsigned long timer;
} modbus_master_action_param_typ;

typedef struct modbus_master_cfg_typ
{	struct modbus_master_action_enable_typ action_enable[30];
	struct modbus_master_action_param_typ action_param[30];
} modbus_master_cfg_typ;

typedef struct modbus_master_internal_typ
{	unsigned short step;
	unsigned short cycle_time;
	plctime time_old;
	struct TcpOpen tcp_open;
	struct TcpIoctl tcp_ioctl;
	struct TcpClient tcp_client;
	struct TcpSend tcp_send;
	struct TcpRecv tcp_receive;
	struct TcpClose tcp_close;
	struct CfgGetIPAddr tcp_ip;
	struct tcpLINGER_typ linger_opt;
	unsigned char last_req;
	unsigned long receive_timer;
	unsigned long send_timer[30];
	unsigned char send_buff[501];
	unsigned char receive_buff[501];
	unsigned short transaction_id;
	unsigned long wrong_message;
} modbus_master_internal_typ;

typedef struct modbus_slave_cfg_typ
{	unsigned long p_discrete_inputs[256];
	unsigned long p_coils[256];
	unsigned long p_input_registers[256];
	unsigned long p_holding_registers[256];
} modbus_slave_cfg_typ;

typedef struct modbus_slave_internal_typ
{	unsigned short step;
	enum step_sub_enum substep;
	unsigned char i;
	unsigned char master_nr;
	unsigned char master_last;
	struct master_info_typ master_info[3];
	unsigned char master_addr[18];
	struct TcpOpen tcp_open;
	struct TcpIoctl tcp_ioctl;
	struct TcpServer tcp_server;
	struct TcpSend tcp_send;
	struct TcpRecv tcp_receive[3];
	struct TcpClose tcp_close;
	struct CfgGetIPAddr tcp_ip;
	struct tcpLINGER_typ linger_opt;
	unsigned char send_buff[501];
	unsigned short send_byte;
	struct receive_buff_typ receive_buff[3];
} modbus_slave_internal_typ;

typedef struct MBslave
{
	/* VAR_INPUT (analog) */
	unsigned long device;
	unsigned short port;
	struct modbus_slave_cfg_typ* p_cfg;
	unsigned long p_log;
	unsigned long master_timeout;
	/* VAR_OUTPUT (analog) */
	plcstring my_ip[21];
	unsigned short status;
	unsigned short last_error;
	/* VAR (analog) */
	struct modbus_slave_internal_typ internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MBslave_typ;

typedef struct MBmaster
{
	/* VAR_INPUT (analog) */
	unsigned long device;
	unsigned short port;
	plcstring slave_ip_addr[19];
	struct modbus_master_cfg_typ* p_cfg;
	unsigned long p_log;
	/* VAR_OUTPUT (analog) */
	unsigned short last_error;
	plcstring my_ip[21];
	unsigned short status;
	/* VAR (analog) */
	struct modbus_master_internal_typ internal;
	/* VAR_INPUT (digital) */
	plcbit enable;
} MBmaster_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MBslave(struct MBslave* inst);
_BUR_PUBLIC void MBmaster(struct MBmaster* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MBUSTCP_ */

